# m_3_3_03.rb
module GeometricForm 
  include Math
  
  def torus(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 1 * ((params[1] + 1 + params[0] * cos(v)) * sin(u))
    y = 1 * (params[0] * sin(v))
    z = 1 * ((params[1] + 1 + params[0] * cos(v)) * cos(u))
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0 
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end
  
  def sphere(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    vc = (2.0 * v) + PI / 2.0
    x = 2 * (sin(vc) * sin(u))
    y = 2 * (params[0] * cos(vc))
    z = 2 * (sin(vc) * cos(u))
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0 
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end
  
  def horn(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    uc = u / PI
    # v /= PI
    x = (2 * params[0] + uc * cos(v)) * sin(2 * u)
    y = (2 * params[0] + uc * cos(v)) * cos(2 * u) + 2 * uc
    z = uc * sin(v)
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0 
    Vec3D.new(x, y, z) * scale if mesh_distortion == 0 + Vec3D.random * mesh_distortion
  end
  
  def shell(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = params[1] * (1 - (u / PI * 2)) * cos(params[0] * u) * (1 + cos(v)) + params[3] * cos(params[0] * u)
    y = params[1] * (1 - (u / PI * 2)) * sin(params[0] * u) * (1 + cos(v)) + params[3] * sin(params[0] * u)
    z = params[1] * (u / PI * 2) + params[0] * (1 - (u / PI * 2)) * sin(v)
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0 
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end
end

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
  sketch_title 'Form'
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
    (MAX_U - 1).times do |iu|  
      points[iv][iu].to_vertex(renderer)
      points[iv+1][iu].to_vertex(renderer)
    end 
    points[0][0].to_vertex(renderer)
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
      row << shell(u: u, v: v, scale: 25)
    end
    points << row
  end
  points
end
