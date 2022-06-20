% path planning
function out = path_planning(select)
    if select == 1
        % three_link_street_x
        for x = 1.5:-0.015:-1.5
            out = [x 1.5];
        end

    elseif select == 2
        % three_link_street_y
        for y = 1.5:-0.015:-1.5
           out = [1 y];
        end

    elseif select == 3
        c_x = 1; c_y = 1; r = 0.6;
        path_x = c_x + r*cos(linspace(0,2*pi,100));
        path_y = c_y + r*sin(linspace(0,2*pi,100));

        for i = 1:length(path_x)
            out = [path_x(i) path_y(i)];
        end
    else
        warning('Select 1 or 2 or 3.')
    end
end
