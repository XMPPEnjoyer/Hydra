_VERSION_ = "1.0.0";
local UI = require("UI");
local settings_toggle = false
local status = 0
local upload_speed = 0
local download_speed = 0
local proxies = 0
local nodes = 0
local server = ""
local time = 0
local font = love.graphics.newFont("font/Comfortaa-Regular.ttf", 40);
love.graphics.setFont(font);
local major, minor, revision, codename = love.getVersion();
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

function love.load()
   
end;
function love.update(dt)
 love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight(),{vsync=1,minwidth=300,minheight=300})
if(love.graphics.getWidth()<100) then
  love.window.setMode(100,love.graphics.getHeight(),{vsync=1,minwidth=100,minheight=300})
end;
if(love.graphics.getHeight()<300) then
  love.window.setMode(love.graphics.getWidth(),300,{vsync=1,minwidth=100,minheight=300})
end;
 UI.update(dt)
 mx=love.mouse.getX()
 my=love.mouse.getY()
 window_width=love.graphics.getWidth()
 window_height=love.graphics.getHeight()
end;
function love.draw()
  GUI();
end;
function c(r,g,b)love.graphics.setColor(r/255,g/255,b/255);end;
function intro()
  
end
function GUI()
  local set_width = 0
  c(35,35,45);
  love.graphics.rectangle("fill", 0, 0, window_width, window_height,15,15,32676);
  c(25,25,35); 
  love.graphics.rectangle("fill", 0, 0, window_width, 45+window_height/50,15,15,32676);
  c(255,255,255)

  if UI.Settings(set_width+1,1,54,54.5,15) then settings_toggle = not settings_toggle end
  c(25,25,35);
  if settings_toggle then
    for i = 0, window_width/1.5 do wait(0.3); set_width = i-.5 end 
    love.graphics.rectangle("fill", 0, 0, set_width, window_height,15,15,32676);
    --settings here
    love.graphics.rectangle("fill", 0, 90, set_width, 150,15,15,32676);
    c(255,255,255)
    love.graphics.print("Upload: "..upload_speed,5,window_height/2+90,0,0.7,0.7)
    love.graphics.print("Download: "..download_speed,5,window_height/2+120,0,0.7,0.7)
    love.graphics.print("Up-Time: "..time,5,window_height/2+150,0,0.7,0.7)
  else
    for i = window_width/2, 0 do wait(0.3); set_width = i end 
  end
  if UI.Connect_Button(0,window_height-64,window_width,55,15,status) then print(1) end
  
end;
