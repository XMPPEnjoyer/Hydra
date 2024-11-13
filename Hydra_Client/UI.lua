local UI={};
local hardware = love.system.getOS()
mx=0
my=0
local function wait(seconds)
  local timer = 0
  return function()
    timer = timer + love.timer.getDelta()
    if timer >= seconds then
      return true
    end
    return false
  end
end
function UI.update(dt)
 mx=love.mouse.getX()
 my=love.mouse.getY()
 window_width=love.graphics.getWidth()
 window_height=love.graphics.getHeight()

  
end;
function hover(x,y,w,h)if(mx>=x and mx<=x+w and my>=y and my<=y+h)then return true;end;end;
function b(x, y, ax, ay, w, h) if x >= ax and x <= ax + w then if y >= ay and y <= ay + h then return true;end;end;end;
function ifclick(x,y,w,h) 
if hardware == "Android" or hardware == "iOS" then
   local touches = love.touch.getTouches()
    for i, id in ipairs(touches) do
     local tx, ty = love.touch.getPosition(id)
     if b(tx,ty,x,y,w,h) then return true; end;
    end;
  else
   function love.mousepressed(tx, ty, button)
     if button == 1 then
      if b(tx,ty,x,y,w,h) then return true; end;
   end;
  end;
end;
end;


function UI.Button(x,y,w,h,r,text)
  love.graphics.setColor(25/255,25/255,30/255);
  if hover(x,y,w,h) then
    love.graphics.setColor(0.07,0.07,0.07)
  end;
  love.graphics.rectangle("fill",x,y,w,h,r,r,32676)
  love.graphics.setColor(1,1,1)
  love.graphics.printf(text,w/2-love.graphics.getFont():getWidth(text)/2,y+h/4, 255, "center", 0, 0.7, 0.7)
  
end;
function UI.Connect_Button(x,y,w,h,r,status)
  if status == 0 then love.graphics.setColor(5,0,0,0.5); love.graphics.rectangle("fill",x,y+10,w,h,r,r,32676) end
  if status == 1 then love.graphics.setColor(5,5,0,0.5); love.graphics.rectangle("fill",x,y+10,w,h,r,r,32676) end
  if status == 2 then love.graphics.setColor(0,5,0,0.5); love.graphics.rectangle("fill",x,y+10,w,h,r,r,32676) end
  love.graphics.setColor(22/255,22/255,32/255)
  if hover(x,y,w,h) then
    love.graphics.setColor(25/255,25/255,32/255);
  end;
  love.graphics.rectangle("fill",x,y,w,h,r,r,32676)
  love.graphics.setColor(1,1,1)
    if status == 0 then love.graphics.printf("Connect",window_width/2-love.graphics.getFont():getWidth("Connect")/2,y+h/4, 255, "center", 0, 0.7, 0.7)end
    if status == 1 then love.graphics.printf("Connecting",window_width/2-love.graphics.getFont():getWidth("Connecting")/2,y+h/4, 255, "center", 0, 0.7, 0.7) end
    if status == 2 then love.graphics.printf("Connected",window_width/2-love.graphics.getFont():getWidth("Connected")/2,y+h/4, 255, "center", 0, 0.7, 0.7) end

end
function UI.Settings(x,y,w,h,r)
  love.graphics.setColor(25/255,25/255,32/255);
  if hover(x,y,w,h) then
    love.graphics.setColor(22/255,22/255,32/255)
  end;
  love.graphics.rectangle("fill",x,y,w,h,r,r,32676)
  love.graphics.setColor(1,1,1)
  love.graphics.print("__",x+w/4,y+10,0,0.7,0.7)
  love.graphics.print("__",x+w/4,y,0,0.7,0.7)
  love.graphics.print("__",x+w/4,y-10,0,0.7,0.7)
if ifclick(x,y,w,h) then return true else return false end
end;



function UI.Checkbox()
   
end;
function UI.Slider()
end;
function UI.Text_Box()
end;
function UI.Tooltip()
  
end; 



return UI;
