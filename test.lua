
-- Positions -- 
postion_x = 0 -- north is +, south is -
postion_y = 0 -- east is +, west is -
position_z = 0 -- up is +, down is -


-- Move Controlls -- 
--  might need to fix so the turtle is always facing north to fix issues

function forward()
    turtle.forward()
    postion_x = postion_x +1
end

function back()
    turtle.back()
    postion_x = postion_x - 1
end

function up()
    turtle.up()
    position_z = position_z + 1
end

function down()
    turtle.down()
    position_z = position_z - 1
end

function right()
    turtle.turnRight()
    turtle.forward()
    postion_y = postion_y + 1
end

function left()
    turtle.turnLeft()
    turtle.forward()
    postion_y = postion_y - 1
end


 -- other stuff --

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
    if turtle.getFuelLevel() <= 60 or turtle.getFuelLevel() == "unlimited" then
        -- select_item("minecraft:coal") assuming get_fuel is always called before this function
        get_fuel()
        turtle.refuel(5)


    end
end

function get_fuel()
    select_item("minecraft:coal")
    if turtle.getItemCount() <= 10 then
        turtle.suckDown(54)
    end
end

            
 
function timber_time()
    local success, data = turtle.inspect()
    local success1, data1 = turtle.inspectUp()

    -- pre condition
    fuelcheck()

    if data.name == "minecraft:log" then
        turtle.dig()
        forward()
        success1, data1 = turtle.inspectUp()
        -- mine up untill tree is gone, then reset positions
        while (data1.name == "minecraft:log" )
        do
            turtle.digUp()
            up()
            success1, data1 = turtle.inspectUp()
        
        end
    
        returnHome()

    else
        print(data.name)
        placeTree()
    end


end


function returnHome()
    while (position_z ~= 0)
    do
        if position_z > 0 then
            down()
        else
            up()
        end
    end
    
    while (postion_x ~= 0)
    do
        if postion_x > 0 then
            back()
        else
            forward()
        end
    end

    while (postion_y ~= 0)
    do
        if postion_y > 0 then
            left()
        else
            right()
        end
    end
end


function placeTree()
    select_item("minecraft:sapling")
    turtle.place()

end

-- function empty_wood()
--     if



-- select_item("minecraft:coal") -- works
-- get_fuel()
while (true)
do 
    timber_time()
end
-- print(turtle.getItemDetail())

-- while 1 do
--     get_fuel()
--     fuelcheck()
--     timber_time()
-- end

