function getOCrankpermission(index, ranks, perm, ocMembers)
    if ( index ~= nil ) then 
       
        for k, v in pairs(ranks) do 
            if v.name == ocMembers[index].rank then
          
                return v.permissions[perm]
            end 
        end 
    else
        return true
    end
end