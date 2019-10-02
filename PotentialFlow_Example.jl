
using PyPlot

#--------------------
#--------------------CHANGE VARIABLES HERE
# Uniform Flow
U_inf = 1 # Velocity
alpha = pi/4 # Angle
#--------------------
#--------------------

#  Create Grid  
minval = -5
maxval = 5
steps = 11
xy_axis = linspace(minval,maxval,steps)
X = repmat(xy_axis',steps)
Y = repmat(xy_axis,1,steps)

# Create Velocity Field
U = U_inf*cos(alpha)*ones(size(X))
V = U_inf*sin(alpha)*ones(size(X))

# Plot
fig = figure(figsize=(6,6))
plot(xy_axis,zeros(size(xy_axis)),color="black",linewidth=0.5, linestyle="--")
plot(zeros(size(xy_axis)),xy_axis,color="black",linewidth=0.5, linestyle="--")

vec = quiver(X,Y,U,V)
streamplot(X,Y,U,V,color=".75",arrowstyle="-")
stream = quiver(NaN,NaN,NaN,NaN,color=".75") # for legend entry

title("Uniform Flow")
xlabel("X")
ylabel("Y")
legend((stream, vec), ("streamlines", "velocity vectors"),bbox_to_anchor=(-.1, 1),markerscale=.4);


using PyPlot

#--------------------
#--------------------CHANGE VARIABLES HERE
# Source
Q_source = 10 # Flow rate
#--------------------
#--------------------

#  Create Grid  
minval = -5
maxval = 5
steps = 11
xy_axis = linspace(minval,maxval,steps)
X = repmat(xy_axis',steps)
Y = repmat(xy_axis,1,steps)

# Create Velocity Field
U = Q_source/(4*pi)*(2*X)./(X.^2+Y.^2)
V = Q_source/(4*pi)*(2*Y)./(X.^2+Y.^2)

# Plot
fig = figure(figsize=(6,6))
plot(xy_axis,zeros(size(xy_axis)),color="black",linewidth=0.5, linestyle="--")
plot(zeros(size(xy_axis)),xy_axis,color="black",linewidth=0.5, linestyle="--")
streamplot(X,Y,U,V,color=".75",arrowstyle="-")
source = scatter(0,0,s=Q_source*50,color=[:green],alpha=0.5)
vec = quiver(X,Y,U,V)
stream = quiver(NaN,NaN,NaN,NaN,color=".75") # for legend entry

title("Source")
xlabel("X")
ylabel("Y")
legend((stream, vec, source), ("streamlines", "velocity vectors", "source"),bbox_to_anchor=(-.1, 1),markerscale=.4);

using PyPlot

#--------------------
#--------------------CHANGE VARIABLES HERE
# Sink
Q_sink = 10 # Flow rate
#--------------------
#--------------------

#  Create Grid  
minval = -5
maxval = 5
steps = 11
xy_axis = linspace(minval,maxval,steps)
X = repmat(xy_axis',steps)
Y = repmat(xy_axis,1,steps)

# Create Velocity Field
U = -Q_sink/(4*pi)*(2*X)./(X.^2+Y.^2)
V = -Q_sink/(4*pi)*(2*Y)./(X.^2+Y.^2)

# Plot
fig = figure(figsize=(6,6))
plot(xy_axis,zeros(size(xy_axis)),color="black",linewidth=0.5, linestyle="--")
plot(zeros(size(xy_axis)),xy_axis,color="black",linewidth=0.5, linestyle="--")
streamplot(X,Y,U,V,color=".75",arrowstyle="-")
sink = scatter(0,0,s=Q_sink*50,color=[:red],alpha=0.5)
vec = quiver(X,Y,U,V)
stream = quiver(NaN,NaN,NaN,NaN,color=".75") # for legend entry

title("Sink")
xlabel("X")
ylabel("Y")
legend((stream, vec, sink), ("streamlines", "velocity vectors", "sink"),bbox_to_anchor=(-.1, 1),markerscale=.4);

using PyPlot

#--------------------
#--------------------CHANGE VARIABLES HERE
# Uniform Flow
U_inf = 1 # Velocity
alpha = pi/4 # Angle
# Source
Q_source = 10 # Flow rate
#--------------------
#--------------------

#  Create Grid  
minval = -5
maxval = 5
steps = 11
xy_axis = linspace(minval,maxval,steps)
X = repmat(xy_axis',steps)
Y = repmat(xy_axis,1,steps)

# Create Velocity Field
U = U_inf*cos(alpha)*ones(size(X)) + Q_source/(4*pi)*(2*X)./(X.^2+Y.^2)
V = U_inf*sin(alpha)*ones(size(X)) + Q_source/(4*pi)*(2*Y)./(X.^2+Y.^2)

# Plot
fig = figure(figsize=(6,6))
plot(xy_axis,zeros(size(xy_axis)),color="black",linewidth=0.5, linestyle="--")
plot(zeros(size(xy_axis)),xy_axis,color="black",linewidth=0.5, linestyle="--")
streamplot(X,Y,U,V,color=".75",arrowstyle="-")
source = scatter(0,0,s=Q_source*50,color=[:green],alpha=0.5)
vec = quiver(X,Y,U,V)
stream = quiver(NaN,NaN,NaN,NaN,color=".75") # for legend entry

title("Uniform Flow + Source")
xlabel("X")
ylabel("Y")
legend((stream, vec, source), ("streamlines", "velocity vectors", "source"),bbox_to_anchor=(-.1, 1),markerscale=.4);

using PyPlot

#--------------------
#--------------------CHANGE VARIABLES HERE
# Uniform Flow 
U_inf = 1 # Velocity
# Source
Q_source = 10 # Flow rate
#--------------------
#--------------------

#  Create Grid  
minval = -5 # minimum 
maxval = 5 # maximum
steps = 11 # grid points
xy_axis = linspace(minval,maxval,steps)
X = repmat(xy_axis',steps) # X Matrix
Y = repmat(xy_axis,1,steps) # Y Matrix


# Create Velocity Field
# phi = U_inf*x + Q_source/(2*pi)*ln[r]
# phi = U_inf*x + Q_source/(2*pi)*ln[(x^2+y^2)^(1/2)]
# phi = U_inf*x + Q_source/(4*pi)*ln[(x^2+y^2)]
U = U_inf*ones(size(X)) + Q_source/(4*pi)*(2*X)./(X.^2+Y.^2) # u = d[phi]/dx
V = Q_source/(4*pi)*(2*Y)./(X.^2+Y.^2) # v = d[phi]/dy

# Plot
fig = figure(figsize=(6,6))
plot(xy_axis,zeros(size(xy_axis)),color="black",linewidth=0.5, linestyle="--") # x-axis
plot(zeros(size(xy_axis)),xy_axis,color="black",linewidth=0.5, linestyle="--") # y-axis
streamplot(X,Y,U,V,color=".75",arrowstyle="-") # streamlines
source = scatter(0,0,s=Q_source*50,color=[:green],alpha=0.5) # source
vec = quiver(X,Y,U,V) # velocity vectors
stream = quiver(NaN,NaN,NaN,NaN,color=".75") # for legend entry

# stagnation point
stagnation = scatter(-Q_source/(2*pi*U_inf),0,s=50,color=[:blue]) 
# plot dividing streamline polar coordinates
theta = linspace(.3*pi,1.7*pi,100) 
r = Q_source./(2*U_inf.*sin(theta)).*(1-theta./pi) 
# convert polar to cartesian 
Rx = r.*cos(theta)
Ry = r.*sin(theta)
plot(Rx,Ry,color="blue",linewidth=2, linestyle="-") # dividing streamline
dividing = quiver(NaN,NaN,NaN,NaN,color="blue") # for legend entry 

title("Uniform Flow + Source")
xlabel("X")
ylabel("Y")
legend((stream, vec, source, stagnation, dividing), ("streamlines", "velocity vectors", "source","stagnation point","dividing streamline"),bbox_to_anchor=(-.1, 1),markerscale=.4);




