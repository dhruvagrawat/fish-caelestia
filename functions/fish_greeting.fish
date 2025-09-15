function fish_greeting
    # Directory with pre-downloaded cat images
    set cat_dir ~/.local/share/cats
    set cats (ls $cat_dir/cat_*.jpg 2>/dev/null)

    # 6 empty lines for padding at the top
    for i in (seq 1 6)
        echo ""
    end

    if test (count $cats) -gt 0
        # Pick a random cat
        set choice (random 1 (count $cats))
        set chosen $cats[$choice]

        if type -q kitty
            # Display the cat image in Kitty
            kitty +kitten icat \
                --align center \
                --place 50x15@0x0 \
                $chosen
        end
    end

    # Meowtrix text below
    set_color green
    echo "
                  
                                
                                              

                                
                                
                                              

                        
                                

                                        
                                           
                                                    
    "
    set_color normal
end
