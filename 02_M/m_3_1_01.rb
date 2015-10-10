# m_3_1_01.rb
#
# Generative Gestaltung, ISBN: 978-3-87439-759-9
# First Edition, Hermann Schmidt, Mainz, 2009
# Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
# Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
#
# http://www.generative-gestaltung.de
#
# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file e_xcept in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing per_missions and
# limitations under the License.

###########
# This sketch is greatly simplified in JRubyArt thanks to ArcBall...
# Rotate the grid by dragging the mouse
# Use mousewheel to zoom
##########
XCOUNT = 4
YCOUNT = 4

def settings
  size(400, 400, P3D)
  smooth(8)
  # pixel_density(2) # for folks with hi-dpi display eg retina
end

def setup
  ArcBall.init(self)
  sketch_title "M_3_1_01"
  fill(255)
  stroke_weight(1 / 80.0)
end

def draw
  background(255)
  scale(40)
  # Draw Mesh
  YCOUNT.times do |y|
    begin_shape(QUAD_STRIP)
    XCOUNT.times do |x|
      vertex(x, y, 0)
      vertex(x, y + 1, 0)
    end
    end_shape
  end
end
