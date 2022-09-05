for i in assets/*.svg
    sed -i 's/#212121/#808080/g' $i
end
