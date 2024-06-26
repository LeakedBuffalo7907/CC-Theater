local baseRepoURL = "http://raw.githubusercontent.com/LeakedBuffalo7907/CC-Theater/main/Remote"

local function downloadFile(path, name)
  local status = "Downloaded"
  if fs.exists(path .. name) then
    fs.delete(path .. name)
    status = "Updated"
  end
  local F = fs.open(path .. name, "w")
  F.write(http.get(baseRepoURL .. path .. name).readAll())
  F.close()
  term.setTextColor(colors.lime)
  print(name .. " " .. status)
  term.setTextColor(colors.white)
end

local function checkFile(path, name) 
  if not fs.exists(path .. name) then
    downloadFile(path, name)
  end
end

  downloadFile("/", "update.lua")
  
  shell.run("reboot")