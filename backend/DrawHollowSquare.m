function DrawHollowSquare(settings, loc, size)

    ow = settings.screen.outwindow;
    pen = settings.layout.boxpen;
    color = settings.color.box;
    x = 1;
    y = 2;
    xloc = loc(1);
    yloc = loc(2);
    
    branch = settings.size.branchbase * size;
    topleft = [xloc-branch,yloc-branch];
    topright = [xloc+branch,yloc-branch];
    bottomleft = [xloc-branch,yloc+branch];
    bottomright = [xloc+branch,yloc+branch];
    
    % Top
    Screen('DrawLine',ow,color,topleft(x),topleft(y),topright(x),topright(y),pen);
    
    % Right
    Screen('DrawLine',ow,color,topright(x),topright(y),bottomright(x),bottomright(y),pen);
    
    % Bottom
    Screen('DrawLine',ow,color,bottomright(x),bottomright(y),bottomleft(x),bottomright(y),pen);
    
    % Left
    Screen('DrawLine',ow,color,bottomleft(x),bottomleft(y),topleft(x),topleft(y),pen);
    
end