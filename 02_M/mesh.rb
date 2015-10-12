# mesh.rb
module GeometricForm
  include Math

  def astroidal_ellipsoid(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    u /= 2
    x = 3 * (cos(u) * cos(v))**(3 * params[0])
    y = 3 * (sin(u) * cos(v))**(3 * params[0])
    z = 3 * sin(v)**(3*params[0])
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end

  def bohemian_dome(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 2 * cos(u)
    y = 2 * sin(u) + params[0] * cos(v)
    z = 2 * sin(v)
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end

  def bow(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    u /= PI * 2
    v /= PI * 2
    x = (2 + params[0] * sin(PI * 2 * u)) * sin(PI * 4 * v)
    y = (2 + params[0] * sin(PI * 2 * u)) * cos(PI * 4 * v)
    z = params[0] * cos(PI * 2 * u) + 3 * cos(PI * 2 * v)
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end

  def corkscrew(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = cos(u) * cos(v)
    y = sin(u) * cos(v)
    z = sin(v) + params[0] * u
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end

  def elliptic_torus(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 1.5 * (params[0] + cos(v)) * cos(u)
    y = 1.5 * (params[0] + cos(v)) * sin(u)
    z = 1.5 * sin(v) + cos(v)
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end

  def figure8torus(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 1.5 * cos(u) * (params[0] + sin(v) * cos(u) - sin(2 * v) * sin(u) / 2)
    y = 1.5 * sin(u) * (params[0] + sin(v) * cos(u) - sin(2 * v) * sin(u) / 2)
    z = 1.5 * sin(u) * sin(v) + cos(u) * sin(2 * v) / 2
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

  def kidney(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    u /= 2
    x = cos(u) * (params[0] * 3 * cos(v) - cos(3 * v))
    y = sin(u) * (params[0] * 3 * cos(v) - cos(3 * v))
    z = 3 * sin(v) - sin(3 * v)
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale if mesh_distortion == 0 + Vec3D.random * mesh_distortion
  end
  
  def lemniscape(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    u /= 2
    cosvSqrtAbsSin2u = cos(v)*sqrt((sin(2*params[0]*u)).abs)
    x = cosvSqrtAbsSin2u*cos(u)
    y = cosvSqrtAbsSin2u*sin(u)
    z = 3 * (x**2 - y**2 + 2 * x * y * tan(v)**2)
    x *= 3
    y *= 3
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale if mesh_distortion == 0 + Vec3D.random * mesh_distortion
  end

  def limpet_torus(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 1.5 * params[0] * cos(u) / (sqrt(2) + sin(v))
    y = 1.5 * params[0] * sin(u) / (sqrt(2) + sin(v))
    z = 1.5 * 1 / (sqrt(2) + cos(v))
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale if mesh_distortion == 0 + Vec3D.random * mesh_distortion
  end

  def maeders_owl(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 0.4 * (v * cos(u) - 0.5 * params[0] * v**2 * cos(2 * u))
    y = 0.4 * (-v * sin(u) - 0.5 * params[0] * v**2 * sin(2 * u))
    z = 0.4 * (4 * v**1.5) * cos(3 * u / 2) / 3
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale if mesh_distortion == 0 + Vec3D.random * mesh_distortion
  end

  def paraboloid(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    pd = params[0]
    pd = 0.0001 if (pd == 0)
    x = (v / pd)**0.5 * sin(u)
    y = v
    z = (v / pd)**0.5 * cos(u)
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

  def sine(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 2 * sin(u)
    y = 2 * sin(params[0] * v)
    z = 2 * sin(u + v)
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

  def steinbach_screw(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = u * cos(v)
    y = u * sin(params[0] * v)
    z = v * cos(u)
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end
  
  def superformula(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    v /= 2
    # Superformel 1
    a = params[0]
    b = params[1]
    m = params[2]
    n1 = params[3]
    n2 = params[4]
    n3 = params[5]
    r1 = ((cos(m * u / 4) / a).abs**n2 + (sin(m * u / 4) / b).abs**n3)**(-1 / n1)    
    # Superformel 2
    a = params[6]
    b = params[7]
    m = params[8]
    n1 = params[9]
    n2 = params[10]
    n3 = params[11]
    r2 = ((cos(m * v / 4) / 2).abs**n2 + (sin(m * v / 4) / b).abs**n3)**(-1 / n1)
    x = 2 * (r1 * sin(u) * r2 * cos(v))
    y = 2 * (r2 * sin(v))
    z = 2 * (r1 * cos(u) * r2 * cos(v))
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end

  def torus(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 1 * ((params[1] + 1 + params[0] * cos(v)) * sin(u))
    y = 1 * (params[0] * sin(v))
    z = 1 * ((params[1] + 1 + params[0] * cos(v)) * cos(u))
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end
  
  def trianguloid(u:, v:, mesh_distortion: 0, scale: 50, params: Array.new(12, 1))
    x = 0.75 * (sin(3 * u) * 2 / (2 + cos(v)))
    y = 0.75 * ((sin(u) + 2 * params[0] * sin(2 * u)) * 2 / (2 + cos(v + PI * 2 )))
    z = 0.75 * ((cos(u) - 2 * params[0] * cos(2 * u)) * (2 + cos(v)) * ((2 + cos(v + PI * 2 / 3))*0.25))
    return Vec3D.new(x, y, z) * scale if mesh_distortion == 0
    Vec3D.new(x, y, z) * scale + Vec3D.random * mesh_distortion
  end
end
