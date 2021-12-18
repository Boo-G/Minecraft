print("Hello World!")
print("work pls?")

postion_x = 0 -- north is +, south is -
postion_y = 0 -- east is +, west is -
position_z = 0 -- up is +, down is -

-- Move Controlls -- 

function forward()
    turtle.forward()
    postion_x += 1
end

function back()
    turtle.back()
    postion_x -= 1
end

function up()
    turtle.up()
    position_z += 1
end

function down()
    turtle.down()
    position_z -= 1
end

function right()
    turtle.turnRight()
    turtle.forward()
    postion_y += 1
end

function left()
    turtle.turnLeft()
    turtle.forward()
    postion_y -= 1
end




function select_item(item_name)

    for i=1, 16 do
        turtle.select(i)
        -- if turtle.getItemDetail()["name"] == "nil" then
        --     print("this is nil")
        if turtle.getItemDetail()["name"] == item_name then
            print("found and selected at index", i)
            break
        -- else
        --     print("error, that item could not be found")
        end   
    end
end

function fuelcheck()
    if turtle.getFuelLevel() < 60 or turtle.FuelLevel() == "unlimited" then
        select_item("minecraft:coal")
        turtle.refuel(5)

    end
end

function get_fuel()
    select_item("minecraft:coal")
    if turtle.getItemCount() <= 10 then
        turtle.suckDown()



select_item("minecraft:coal")
            
 
function timber_time()
    if turtle.inspect() == "minecraft:Oak Log" then
        turtle.dig()
        forward()
    end
    while turtle.inspectUp == "minecraft:Oak Log" then
        turtle.digUp()
        up()
    end
    while position_z != 0 then
        down()
    end
    while postion_x != 0 then
        back()
    end



-- fuelcheck()
while 1 then
    get_fuel()
    fuelcheck()
    