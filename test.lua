print("Hello World!")
print("work pls?")

function select_item(item_name)

    for i=1, 16 do
        turtle.select(i)
        if turtle.getItemDetail() == "nil" then
            print("this is nil")
        elseif turtle.getItemDetail()["name"] == item_name then
            print("found and selected at index", i)
            break
        -- else
        --     print("error, that item could not be found")
        end   
    end
end

function fuelcheck()
    if turtle.getFuelLevel() < 60 or turtle.FuelLevel() == "unlimited" then
        for i=1,16 do
            if turtle.getItemDetail()["name"] == "minecraft:coal" then
                turtle.select(i)
                turtle.refuel(2)
            end
        end
    end
end



select_item("minecraft:coal")
            
 
-- fuelcheck()