export EDITOR=hx
export DISPLAY=:0
export WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-1}
export XDG_CURRENT_DESKTOP=wlroots

wl-clip-persist --clipboard regular --reconnect-tries 0 &
wl-paste --type text --watch cliphist store &

noctalia-shell &
