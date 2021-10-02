--- Excute On Tencent Logo ---
local gg = gg
gg.toast("WELCOME ....")
gg.setVisible(false)
 
local memFrom, memTo, lib, num, lim, results, src, ok = 0, -1, nil, 0, 32, {}, nil, false
function name(n)
if lib ~= n then
lib = n
local ranges = gg.getRangesList(lib)
if #ranges == 0 then
gg.toast("OPEN PUBGM FIRST TO EXCUTE THIS SCRIPT")
gg.setVisible(true)
os.exit()
else
memFrom = ranges[1].start
memTo = ranges[#ranges]["end"]
 end
end
end
function hex2tbl(hex)
local ret = {}
hex:gsub("%S%S", function(ch)
ret[#ret + 1] = ch
return ""
end)
return ret
end
function original(orig)
local tbl = hex2tbl(orig)
local len = #tbl
if len == 0 then
return
end
local used = len
if len > lim then
used = lim
end
local s = ""
for i = 1, used do
if i ~= 1 then
s = s .. ";"
end
local v = tbl[i]
if v == "??" or v == "**" then
v = "0~~0"
end
s = s .. v .. "r"
end
s = s .. "::" .. used
gg.searchNumber(s, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, memFrom, memTo)
if len > used then
for i = used + 1, len do
local v = tbl[i]
if v == "??" or v == "**" then
v = 256
else
v = ("0x" .. v) + 0
if v > 127 then
v = v - 256
end
end
tbl[i] = v
end
end
local found = gg.getResultCount()
results = {}
local count = 0
local checked = 0
while not (found <= checked) do
local all = gg.getResults(8)
local total = #all
local start = checked
if total < checked + used then
break
end
for i, v in ipairs(all) do
v.address = v.address + offset
end
gg.loadResults(all)
while total > start do
local good = true
local offset = all[1 + start].address - 1
if len > used then
local get = {}
for i = lim + 1, len do
get[i - lim] = {
address = offset + i,
flags = gg.TYPE_BYTE,
value = 0
}
end
get = gg.getValues(get)
for i = lim + 1, len do
local ch = tbl[i]
if ch ~= 256 and get[i - lim].value ~= ch then
good = false
break
end
end
end
if good then
count = count + 1
results[count] = offset
checked = checked + used
else
local del = {}
for i = 1, used do
del[i] = all[i + start]
end
gg.removeResults(del)
end
start = start + used
end
end
end
function replaced(repl)
num = num + 1
local tbl = hex2tbl(repl)
if src ~= nil then
local source = hex2tbl(src)
for i, v in ipairs(tbl) do
if v ~= "??" and v ~= "**" and v == source[i] then
tbl[i] = "**"
end
end
src = nil
end
local cnt = #tbl
local set = {}
local s = 0
for _, addr in ipairs(results) do
for i, v in ipairs(tbl) do
if v ~= "??" and v ~= "**" then
s = s + 1
set[s] = {
address = addr + i,
value = v .. "r",
flags = gg.TYPE_BYTE
}
 end
end
end
if s ~= 0 then
gg.setValues(set)
end
ok = true
end
 
--- EMU TRIGGERED ---
gg.processPause() 
--TERSAFE--
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x13880
original("7F 45 4C 46 01 01 01 00")
replaced("A8 00 00 00 A8 00 00 00 48 C2 20 B4 04 BC")
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x1388F
original("7F 45 4C 46 01 01 01 00")
replaced("9B") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x138D8
original("7F 45 4C 46 01 01 01 00")
replaced("A8 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x138DC
original("7F 45 4C 46 01 01 01 00")
replaced("A8 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x1393C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x13940
original("7F 45 4C 46 01 01 01 00")
replaced("00 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so") 
offset = 0x13A50
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so") 
offset = 0x164E3
original("7F 45 4C 46 01 01 01 00")
replaced("BF 02 9A 03 A9 00 F0 00 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x166B1
original("7F 45 4C 46 01 01 01 00")
replaced("00 BF 00 BF 06 9B 18 78") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x16985
original("7F 45 4C 46 01 01 01 00")
replaced("BF 00 BF") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x16989
original("7F 45 4C 46 01 01 01 00")
replaced("9B 18 78") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so") 
offset = 0x169B6
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 00 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x16BAA
original("7F 45 4C 46 01 01 01 00")
replaced("04 BC 04 BC 00 BF 02 9A 03 A9 00 F0") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x17640
original("7F 45 4C 46 01 01 01 00")
replaced("2A 00 00 00") 
gg.clearResults()
 
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x30ED7
original("7F 45 4C 46 01 01 01 00")
replaced("00 AF 00 BF 00 BF 06 9B 18 78 80 BD")
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x32BDA
original("7F 45 4C 46 01 01 01 00")
replaced("01 BC 00 BF 00 BF 00 2C 01 D0 01 20")
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x3972F
original("7F 45 4C 46 01 01 01 00")
replaced("E0")
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so") 
offset = 0x39E69
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 00")
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x4CE04
original("7F 45 4C 46 01 01 01 00")
replaced("01")
gg.clearResults() 
 
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x8EB7D
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 00")
gg.clearResults()
 
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x8EB9E
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 00 00")
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x1CC9B8
original("7F 45 4C 46 01 01 01 00")
replaced("A8 00 00 00 A8 00 00 00 72 00 A0 E3")
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so") 
offset = 0x1CC9C2
original("7F 45 4C 46 01 01 01 00")
replaced("00 EA 66")
gg.clearResults() 
 
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so") 
offset = 0x1CC9C6
original("7F 45 4C 46 01 01 01 00")
replaced("00 EA")
gg.clearResults() 
 
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x2E5D51
original("7F 45 4C 46 01 01 01 00")
replaced("BF") 
gg.clearResults()
 
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x2E5D53
original("7F 45 4C 46 01 01 01 00")
replaced("00 90 00 90 BF 01 B0 F0 BA 14 01 00")
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x2F97ED
original("7F 45 4C 46 01 01 01 00")
replaced("BF") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libtersafe.so")
offset = 0x2F97EF
original("7F 45 4C 46 01 01 01 00")
replaced("00 D0 00 BF 01 B0 F0 B2") 
gg.clearResults()

--UE4--
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x12B6A70
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x12BFD2C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x12C01AC
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x12C0FD4
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x12C1308
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x12C35FC
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x12C38A8
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x13451C0
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x13559C0
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x13BD570
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x1484382
original("7F 45 4C 46 01 01 01 00")
replaced("A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x14EA014
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x159DE4C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x159EB74
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x15CA13C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x15CBBE8
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x15D03C0
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x15D0758
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x15D1370
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x15D1CD8
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x17741B0
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x18C24CC
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x18C2698
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x1EB4110
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x1F4CFE0
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x2055778
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x2091A4C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x2091BAC
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x2092918
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x2092A34
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x2092B50
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x2092C64
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x2092D28
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x2092E3C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults() 

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x20EE670
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x21171D8
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x219BEE0
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x2212F64
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x221DD4C
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x2226174
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x2317698
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x2537D00
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x28B2A9A
original("7F 45 4C 46 01 01 01 00")
replaced("00 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x361F028
original("7F 45 4C 46 01 01 01 00")
replaced("00")
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x361F02B
original("7F 45 4C 46 01 01 01 00")
replaced("00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x4E4B7DC
original("7F 45 4C 46 01 01 01 00")
replaced("00 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so")
offset = 0x4E4B7E0
original("7F 45 4C 46 01 01 01 00")
replaced("1E FF 2F E1") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x4E4B888
original("7F 45 4C 46 01 01 01 00")
replaced("00 00") 
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x4E4B88C
original("7F 45 4C 46 01 01 01 00")
replaced("1E FF 2F E1")  
gg.clearResults()

gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA)
name("libUE4.so") 
offset = 0x4E4BA80
original("7F 45 4C 46 01 01 01 00")
replaced("00 00 A0 E3 1E FF 2F E1")
gg.clearResults() 

--exp--


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1288ba4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1288cb0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1289014 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1289318 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12896c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12898a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1289e9c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x128a268 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b4a0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b4bb8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b57c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b601c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b6a70 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b7d18 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b7f40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b81ac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b8e74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b92fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b9984 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b9abc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12b9f2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12ba214 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12ba3c8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bb078 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bbe34 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bc244 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bd050 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12be188 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12be640 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12be7dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bea58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bebf4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bedf4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12befc8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bf768 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bf978 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12bfd2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c01ac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c05a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c0804 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c0c58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c0fd4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c1308 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c1864 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c1fb8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c2de4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c35fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c38a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c4374 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c4fe0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c585c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c5e7c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c608c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c6440 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c6910 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c6dc8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c6f94 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c712c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12c75cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cda40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cdf80 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12ce120 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12ce2a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12ce468 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12ce48c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12ce668 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12ced7c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cf238 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cf76c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cf978 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cfd64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cfe14 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cfec4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12cff74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d0400 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d0460 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d55b2 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d55b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d55c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d57b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d5844 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d59b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d59fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d5b50 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d656c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d6690 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d6e2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d6f0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d7904 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d7a94 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12d7f04 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12deab0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12e0888 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12e0c0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12e15c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12f9b10 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x12fcfb0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1303974 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x130f570 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x130f5e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x130f654 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1340ef0 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1340fc8 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x13451c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x13559c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1356170 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1356174 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x13bd570 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x13bee54 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x13bf030 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x13ebee0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x13ec844 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x13fc43c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1403e30 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1404010 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1404060 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x140472c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1404d60 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1404e74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1404fd0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x14050b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1405168 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x14053a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1405610 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x14057d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1405e88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1406080 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1484382 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x14ea014 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1573698 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1573834 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15760a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1597f64 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1598174 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15982f4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15986f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1598890 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1598c88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1599030 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15994d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159a764 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159ab54 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159b294 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159de4c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159e198 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159e4fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159eb74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159f66c 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x159f7e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a05b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a0d68 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a0e8c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a1aa8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a2a54 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a2e38 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a30dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a3354 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a35a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a377c 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a3888 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a5328 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15a678c 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15ca13c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cb040 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cb2e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cb5c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cb884 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cba24 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cbbe8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cc198 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cc3b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 00 00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cd648 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cd7f4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cde10 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cdf2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15ce390 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cef08 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cf0d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15cf1f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 00 00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d0054 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d0248 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d03c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d0758 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d0964 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d0cfc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d0fd8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d1370 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d17c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d1868 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d1b44 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d1cd8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d1de4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15d1f6c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15eac74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x15eaf6c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1616d58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16176f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x161f7dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x167f44c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x167fca8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1685c54 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x168863c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1688f14 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1688fe4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x168936c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1690c0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x169200c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1693760 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1693ba4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1693ddc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16978dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1698028 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x169b7a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x169bfd8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x169c1d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x169ccd8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x169ce40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x169d968 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16a0640 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16a0b60 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16a3db8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16a950c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16ab08c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16bd520 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16cd794 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16cfcac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16cfe38 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16d479c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16d47e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16d4a90 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16d4b0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16d6eec 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16ddd08 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x16ef268 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1709ff4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x170a298 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x170aa80 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x171f0d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x171f234 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17214b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1725240 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x172c450 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x172d624 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1730e50 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17318d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 00 64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1731e74 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1732320 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x173ad94 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x173bbc0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17426ac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17438b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17447dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1744c94 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1747da8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x174c804 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x174c900 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x174ce68 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x174d544 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x174d5e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x174d674 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1755614 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1756658 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x175793c 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1757950 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1757b78 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1757bec 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1758ec4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17595e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x175b57c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17642a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17648a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1768910 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x176e3c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17741b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x177732c 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1777d9c 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x178bbc4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x179617c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17b9128 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17b959c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17b9a38 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17ba0bc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17ba3c8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17ba6a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17bac18 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x17baeb0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1809d98 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18144d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1814e24 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18216f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1893b54 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1896869 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x189686b 
original("7F 45 4C 46 01 01 01 00") 
replaced("e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c06a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c07bc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c0ae4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c0d2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c1298 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c1984 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c24cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c25e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c263c 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18c2698 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18cb850 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18cbaf8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18cc564 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18d114c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18d12f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18d2c04 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x18d392c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x194b6e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x194b6f4 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x194bcb8 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x194be68 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x194c200 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x195628c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x19748ac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x197be88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x19d12b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a1d0c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a21480 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a255d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a257d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a25b88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a3de78 
original("7F 45 4C 46 01 01 01 00") 
replaced("64 9 a00 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a3f890 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a42578 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a452c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a454f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a4bf80 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a4f4d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a53cb8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a58400 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a58c90 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a59064 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a591b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a5a318 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a5db41 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a5db4c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a5dfb0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7008c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a705fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a70e2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a71450 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a729a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a72d58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a736b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a79168 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a79e6c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a79e6e 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7a060 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7a5c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7abe4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7ae30 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7b64c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7b950 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7b952 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7c219 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7c464 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7f518 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7f950 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a7fb34 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a800c8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a80810 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a80878 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a809dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8104c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a810c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8129c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a812e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a818c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a81994 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a81f8c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a82064 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a82184 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a82848 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a82a88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a82c5c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a82e04 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a82ebc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a82f74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a87ef0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a88014 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8818c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a88328 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a88500 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a88844 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8897c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a88a28 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a88ca4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a88ed4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a89114 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a89358 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a893f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a89488 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a89514 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a895a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8960c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a897a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a89810 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a89918 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a899d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a89b0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8a041 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8a074 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8a2bc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8a550 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8a68c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8a7cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8a91c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8ac18 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8ae7c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b1a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b234 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b2a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b2f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b3ac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b644 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b74c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b7e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8b840 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8bf68 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8bf90 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8c22c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8c318 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8c540 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8d0dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8d1f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8d2a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8d564 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8d8a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a8d9b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9580c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a96410 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a968b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a970a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a970dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a971c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a97688 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a97a40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a97c88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a97ccc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a97db8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a97ea4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a97f90 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9804c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9813c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a982e5 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9837c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98444 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98446 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98508 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9858c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98610 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98a28 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98a9c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98b10 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98c58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98d74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98f50 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a98fec 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9926c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a99f40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9a494 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9a918 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9aaa0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9ac8c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9adb4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9ae40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9b1cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9b3a5 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9b3fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9b678 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9baac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9bc24 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9bd9c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9bf34 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9c250 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9c564 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9c68c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9c7b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9ca9c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9cf64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9d008 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9d0c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9d160 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9ddf8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9de70 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9ded4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9df54 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9e00c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9e1f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9e324 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1a9e8c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1aa17c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1aa1909 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1aa19c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1aa1abd 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1aa2424 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1aa24ec 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b53d8c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b54280 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5433c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b543f9 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5442c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b54524 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b54680 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b54820 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b54ca8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b54dd8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b550e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b55584 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b55bd4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b55f40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b580cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b586ac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b589e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b58e3c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b591dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5973c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b59acc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b59bb4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b59e54 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b59ed9 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b59f2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5a1e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5a2b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5a658 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5ab74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5ae88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5b298 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5b950 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5bd50 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5c560 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5d744 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5de10 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5eb90 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5efcc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b5fff8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b60540 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b60708 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1b6f9f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1be5c7c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d7f040 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d7f414 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d7f4d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d7fc20 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d7fedc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d809b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d8141c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d81e10 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d823c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1d824b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1db5b10 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1dc8028 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1df2718 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1df2988 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1df3014 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1df3764 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e00be0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e018bc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e039b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e3f7b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e412a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e49dcc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4a36c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4a8f4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4ad38 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4ae90 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4b050 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4b6a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4b8e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4c5d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4c6c8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e4c78a 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e553a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e70ca4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e7c8bc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e83f58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1e904fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1eb34a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1eb4110 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ec6f2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ece5cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ece5fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ece7f4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ece824 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1edbc58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1edf360 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ee0598 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ee0884 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ee0c74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ee0ea0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ee1694 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ee2120 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ee2230 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ee65e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef7388 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef771c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef78c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef78c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef7ca4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef7d50 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef8178 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef85cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef8ba4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef95b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef9718 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef978c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef978f 
original("7F 45 4C 46 01 01 01 00") 
replaced("e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1ef9f3c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1efa0b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1efa294 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1f4cfe0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1fc4254 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2055778 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2091a4c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2091bac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092370 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092434 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x20924b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092578 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x209263c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092700 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092918 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092a34 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092b50 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092c64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092d28 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2092e3c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x20bfd50 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x20ee5ac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x20ee5d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x20ee670 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x21171d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x212d2e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x212d398 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x219bee0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2212f64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x221dd4c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2226174 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2317698 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2317aea 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2317aec 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2338080 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x233881c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x233881e 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x237bbb4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x237c6d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x237c99c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23e90fa 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23e90fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23e96a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23e98ba 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23e98bc 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23e9b3c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23e9cc4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23ea07e 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23ea080 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23ea301 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23ebc14 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f0c38 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f2abc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f2c74 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f2c76 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f2c9d 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f3188 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f3b68 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f4b88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f5fc0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23f636c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23fa828 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23fac04 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x23fb724 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2404184 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24054a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2405f10 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2407dfc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24081f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x240838c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x240ad58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x240ae90 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x240b7b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x240bdc0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x240cc6c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x240d594 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24110cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24118cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2412518 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2412d30 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2412d32 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24132d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x241373c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2413dfc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2415220 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2415378 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2415488 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2415758 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2415858 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2415970 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2416980 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x241732c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24176cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24176cf 
original("7F 45 4C 46 01 01 01 00") 
replaced("e3 1e") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2417738 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x241773a 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2417aa0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2418118 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2418a28 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x241b948 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x241c614 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x241c7dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x241df64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2435ad4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24368d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2436be4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x243705c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24371a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24376b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24378ec 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2439548 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x243a444 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x243bfbc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x243c330 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x243caec 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x243dd5c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x243df74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x243f7e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x244094c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2440e5c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2440fe0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24414c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24420d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24444e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2444f04 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2445400 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2445ac4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2447338 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24477d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2447c40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2447e20 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2448e60 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2449474 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2449748 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2449c18 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x244ba84 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x244c82c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x244cd34 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x244d778 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x244dc1c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x244e0c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x244ee2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x245082c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2450bb8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x245a90c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x245ed64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x246cbd8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x246cfc0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x246f86c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x247112c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24712f4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2471a64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24798f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x247a530 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x247fb0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2490340 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a349c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a5088 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a5c1c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a60d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a6190 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a6730 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a99e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a9c98 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24a9d58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24aa134 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24aa6fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24ab034 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24ab9dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24aba9c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24abb5c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24abc1c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24abcdc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24c0418 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24c8b30 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24c9048 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24ca9d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24cc230 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24cc5a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24cd490 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24cd9d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24cecfc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24cf780 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24cf840 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24cf900 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24d9ae4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24e17e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24e4cb0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24e5040 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24e66f4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24e7854 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24e7edc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24ebcd4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24ebcf0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f03d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f03d3 
original("7F 45 4C 46 01 01 01 00") 
replaced("e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f06c4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f07c8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f09bc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f0d70 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f1f68 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f549c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f549e 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f5544 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f5bb0 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1 00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x24f6b3c 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1 00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2500fdc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x252257c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25226d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1 00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2524454 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25245a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25254d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2526e1c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2526e40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25289e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x252ba64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x252d2c8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2530524 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2530ce8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25369f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2536c5e 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2537678 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2537860 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1 00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2537d00 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253839c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2538758 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253875a 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253881c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253881e 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25388e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2538a70 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2538af0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2538b94 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25391b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2539828 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2539f64 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253a584 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253a654 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253a830 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253aa58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253abec 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x253fa44 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2540004 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2540184 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254031c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25404a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254061c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2540794 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254097c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2540b54 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2540d91 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2541188 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25413f5 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2541508 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25416a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2541860 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2541b54 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2541ce8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2542094 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2542500 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254264c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2542c34 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2542c38 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2542ce0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2543724 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2543b30 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25443ac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254441c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2545049 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254537c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2545484 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2545628 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25456e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2545f38 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25473a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2548238 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254823c 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254848c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2548490 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2548538 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254853c 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25485e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25485e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254930c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254ac94 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254c4a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254c674 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254cc60 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254cf08 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x254d26c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2552d0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25536e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2553c3c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25542d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2559a58 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x255b180 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25636f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2570208 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2586e38 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2599fa4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x25d03d4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x260fe2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2610210 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x261dd08 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1 00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x263b190 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x263b96c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x263c0e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x263cb24 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x26478e4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2655efc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2656184 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x26888b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2688964 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2688f2c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2691d14 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x26ab4fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x26bb994 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x26c0db0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x27b0898 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x27e4254 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x27e438c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x27e5844 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x27e5bdc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x27edadc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2d9f5a4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2d9f648 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2d9f64a 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2d9f64e 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 00 00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2d9f655 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 00 00 00 00 00 00 00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x2f153f4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38ac0d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38aceac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38ad6f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38ad848 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38ad998 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38adae8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38add5c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38ae00c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38ae3a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38ae714 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38aea7c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38aed44 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38af0b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x38afab4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x392570c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3a2e8f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3a2edb8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3a2f0b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3ac0040 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3ac05e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3be6b74 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3be7250 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c170f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c30274 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c30cbc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c30ed0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c316e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c3192c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c32164 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c32d30 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c330bc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x3c3345c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x45f5a14 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x45f5d88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x45f5e84 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x45f6420 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x45f6a14 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x45f6d88 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4a7f104 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4a7f150 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4a7f8c8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4a80258 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4b40fc9 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4bc3819 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4c362d5 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4c37cb1 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 a0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4d74be8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e34690 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e37f8c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e38924 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e39290 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e3b6fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e3bd38 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e47ab8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e48220 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e4b7dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e4b7e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e4b888 
original("7F 45 4C 46 01 01 01 00") 
replaced("00") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e4b88c 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e4ba80 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4e4c258 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x4fb26e8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x505506c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5140fe0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51413cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514140c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5141688 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51417dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51417de 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5141894 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51418a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51418aa 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51418c0 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51418c2 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51419a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5141c84 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5141c9c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5141d1c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5141d9c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142098 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51420b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142104 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142106 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51421a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51421aa 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51421e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142220 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142222 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51422a0 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51422a2 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142328 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514233c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514233e 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142378 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142388 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51423d0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51423e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514242c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514242e 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1 00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514245c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514245e 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1 00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142490 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1 00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51424b8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51424c8 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51424ca 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51424f8 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51424fa 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1 00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142518 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142528 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514257c 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514257e 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142586 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51425a1 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142658 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142700 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142968 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514296a 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142972 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514298c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142b18 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142d78 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142d84 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142dd0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142e16 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142e18 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142e61 
original("7F 45 4C 46 01 01 01 00") 
replaced("0 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5142fa4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51432b4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51432ec 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x514346c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51434cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5143878 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5143a1c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5144520 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51465cc 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51465ce 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51467fc 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x51467fe 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5289ed4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x528a124 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x52912a8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5291bd4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5291f84 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5292164 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x52923d8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x52927b0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5292ad8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5292d68 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5292fe4 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5293ca8 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x52982ec 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x52984e0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x52986dc 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5298964 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5298d84 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529909c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5299470 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529965c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5299a18 
original("7F 45 4C 46 01 01 01 00") 
replaced("0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5299a1a 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529b784 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529b870 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529b934 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529ba78 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529bb40 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529bc04 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529bd48 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529bf4c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529c008 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529c118 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529c270 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529c380 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529c524 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x529c66c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5498fac 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x5499c54 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 a0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x55406f0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x554b138 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x554b614 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x554bd24 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x554bd5c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x557cb1c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x557cec0 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x55e906c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x55eb71a 
original("7F 45 4C 46 01 01 01 00") 
replaced("e0") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x55eb71c 
original("7F 45 4C 46 01 01 01 00") 
replaced("1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x55edf0c 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x55ee098 
original("7F 45 4C 46 01 01 01 00") 
replaced("00 e0 e3 1e ff 2f e1") 
gg.clearResults()


gg.setRanges(gg.REGION_CODE_APP | gg.REGION_C_DATA) 
name("libUE4.so") 
offset = 0x1288a6a 
original("7F 45 4C 46 01 01 01 00") 
replaced("a0 e3 1e ff 2f e1") 
gg.clearResults()




 
gg.processResume()
gg.alert("BYPASS HAS BEEN COMPLETED")