-- FEMM Lua script V2 01/02/18
-- Will produce a .bmp image of simulation in zoomed region.
-- Rotor torque (weighted stress tensor) estimated for objects in group 1 and printed to console. 
-- Rotor will be rotated n number of steps around point 0,0 over desired rotation range.  

showconsole()
clearconsole()
mydir="./" -- directory that lua script is placed in
open(mydir .. "hfi.fem") -- name of file that script will run on
mi_saveas(mydir .. "temp.fem")
mi_seteditmode("group")
step=30 -- number of steps to solve where angle resolution = rotation / step
rotation=6 -- range that rototr will be rotated over
for n=0,step do
	mi_modifycircprop("A",1,0) -- set phase current to 0A first
    mi_analyze(0) -- 0 = fkern progres window, 1 = hides fkern progres window
    mi_loadsolution()
	current1, volts, flux1 = mo_getcircuitproperties("A") -- measure flux for 0A. Flux because of magnet.
	mi_modifycircprop("A",1,1) -- set phase current for 1A
    mi_analyze(0) -- 0 = fkern progres window, 1 = hides fkern progres window
    mi_loadsolution()
	current2, volts, flux2 = mo_getcircuitproperties("A") -- measure flux for 1A. Flux with magnet and current.
	print(angle,flux2-flux1) -- print angle and flux difference. Flux difference is the approximate inductance.
    if (n == 0) then -- removed for n > 0 to save time
        mo_resize(1200,1000) -- set output window size (width,height)
        mo_zoom(-50,-70,50,50)
    end
    -- mo_showcontourplot(-1) --19 contour lines, -0.01 to 0.1
	mo_showdensityplot(1,0,2.1,0,"bmag")
	filename = n..".bmp"
    mo_savebitmap(filename)
    -- mo_hidecontourplot() -- hidden to speed up subsequent steps 
    mo_hidedensityplot()
	angle=(rotation*n)
    if (n<step) then
        mi_selectgroup(1)
        mi_moverotate(0,0,rotation)
    end
end