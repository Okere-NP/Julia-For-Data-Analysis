# Checking for supertypes
function print_supertypes(T)
    println(T)
    T == Any || print_supertypers(supertype(T))
    return nothing    
end;

# Checking for subtypes
function print_subtypes(T, indent_level=0)
    println(" " ^ indent_level, T)
    for s in subtypes(T)
        print_subtypes(s, indent_level + 2)
    end
    return nothing    
end;