{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                margin = "7";

                modules-left = ["hyprland/workspaces" "tray" "network" "bluetooth" "hypland/window"];
                modules-center = ["cava"];
                modules-right = ["clock" "pulseaudio" "memory" "cpu" "custom/separator" "custom/reboot" "custom/power"];
            };
        };
        "hyprland/workspaces" = {
            disable-scroll = false;
            all-outputs = true;
            format = "{icon}";
            on-click = activate;
        };
        "cava" = {
            exec = "{cava -p ~/.config/cava/config}";
            format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
            format = "{}";
            tooltip = false;
            method = "pipewire";
            input_delay = 1;
            bar_delimiter = 0;
        };

        "custom/separator" = {
            format = " ";
            tooltip = false;
        };

        "custom/reboot" = {
            format = "";
            on-click = "systemctl reboot";
            tooltip = true;
            tooltip-format = "Reboot system";
        };

        "custom/power" = {
            format = "";
            on-click = "systemctl poweroff";
            tooltip = true;
            tooltip-format = "Shutdown";
        };

        "network" = {
            format-wifi = "󰤨 connected";
            format-ethernet = "  Wired";
            tooltip-format = "{essid} 󰅧  {bandwidthUpBytes} 󰅢  {bandwidthDownBytes}";
            format-linked = "󱘖 {ifname} (No IP)";
            format-disconnected = " Disconnected";
            format-alt = "󰤨 {signalStrength}%";
            interval = 1;
        };

        "pulseaudio" = {
            format = "{icon} {volume}%";
            format-muted = "󰖁 0%";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
            on-click-right = "pavucontrol";
            tooltip = true;
            tooltip-format = "Volume: {volume}%";
        };

        "memory" = {
            format = "  {used:0.3f}G";
            tooltip = true;
            tooltip-format = "Memory used: {used:0.2f}G/{total:0.2f}G";
        };

        "cpu" = {
            format = "  {usage}%";
            tooltip = true;
        };

        "clock" = {
            interval = 1;
            timezone = "Europe/Moscow";
            format = "  {:%Y-%m-%d %H:%M}";
            tooltip = true;
        };

        "tray" = {
            icon-size = 17;
            spacing = 6;
        };

        "bluetooth" = {
            format = " {status}";
            format-connected = " {device_alias}";
            format-connected-battery = " {device_alias} {device_battery_percentage}";
            tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connected} device(s)";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_alias} ({device_address})";
            tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address} {device_battery_percentage}%";
        };

        style = 
        ''                                
        * {
            font-family:"hack", "CaskaydiaCove Nerd Font", "Font Awesome 6 Free", "Font>
            font-size: 13px;
            font-weight: bold;
            
            border-radius: 15px;

            min-height: 0;
        }
        #waybar {
            background-color: #160e17; 
            color: #e8e0ea;

            transition-property: background-color;
            transition-duration: 0.5s;
            
            border: 3px solid #410760;
        }

        #window,
        #clock,
        #bluetooth,
        #pulseaudio,
        #memory,
        #cpu,
        #network,
        #custom-reboot,
        #tray,
        #cava,    
        #custom-power
        {
            border-radius: 8px;    
            
            padding: 6px 15px;
            margin:  12px 3px;

            background-color: #2f1e38;
            color: white;
        }

        #custom-separator {
            margin-left: 25px;
        }

        #custom-power {
            margin-right: 20px;
            background-color: #5b4560;
        }

        #window {
            background-color: #5b4560; 
        }

        #workspaces {
            background: none;
            padding-left: 20px;
            padding-right: 25px;
            margin: 6px 0; 
        }

        #waybar.hidden {
            opacity: 0.5;
        }

        #workspaces button {
            all: initial;
            min-width: 0;
            box-shadow: inset 0 -3px transparent;
            padding: 6px 13px;
            margin: 6px 3px;
            border-radius: 8px;
            background-color: #221824;
        }

        #workspaces button.active {
           background-color: #5b4560;
        }

        #workspaces button:hover {
            box-shadow: inherit;
            text-shadow: inherit;
            background-color: #a281ab;
            color: #160e17;
        }

        tooltip {
            border-radius: 8px;
            padding: 16px;
            background-color: #2c202f;
            color: #e8e0ea;
        }

        tooltip label {
            padding: 5px;
            background-color: #2c202f;
            color: #e8e0ea;
        }

        '';
    };
}