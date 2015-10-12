# m_3_3_03.rb
require_relative 'mesh'
include GeometricForm

U_RANGE = (-PI..PI)
V_RANGE = (-PI..PI)
MAX_V = 200
MAX_U = 200

attr_reader :renderer, :points

def settings
  size 300, 300	, P3D
end

def setup
  sketch_title 'Geometric Forms'
  ArcBall.init(self)
  @renderer = AppRender.new(self)
  @points = generate_points(MAX_U, MAX_V)
  no_stroke
  fill rand(255),rand(255), rand(255)
end

def draw
  background 200
  setup_lights
  (MAX_V - 1).times do |iv|
    begin_shape(TRIANGLE_STRIP)
    (MAX_U).times do |iu|
      points[iv][iu].to_vertex(renderer)
      points[iv + 1][iu].to_vertex(renderer)
    end
    end_shape
  end
end

def setup_lights
  lights
  light_specular(230, 230, 230)
  directional_light(200, 200, 200, 0.5, 0.5, -1)
  specular(color(200))
  shininess(5.0)
end

# Edit this method to choose different shape
def generate_points(u_count, v_count)
  points = []
  v_count.times do |iv|
    row = []
    u_count.times do |iu|
      u = map1d(iu, (0..u_count), U_RANGE)
      v = map1d(iv, (0..v_count), V_RANGE)
      # default scale: 50, param: Array.new(12, 1) and mesh_distortion: 0
      row << superformula(u: u, v: v)
    end
    points << row
  end
  points
end
