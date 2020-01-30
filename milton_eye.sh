#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# This script draws the blinking eye of Milton Library Assistant from The Talos
# Principle game.
# If `sox` installed, audible beeps are enabled (using `play` command).

EYE1=(
    "                        ...',,;:::cccc::;,'..                    "
    "                    ..,;:cllllloooooooddxxxdol;'.                "
    "                 .',:cccc:cc:lloooxxxdxxkkkkkxodlc;,.            "
    "               .';:;;,,;:cddccdxxdxkOO0XWWWWWNXK0Okxdl:,.        "
    "            ..'',,,'';ldl:,.         .'dNMMMMMMWMMWWKkdxx:.      "
    "         ...''.....;cl;.               oKWMMMMMWKOOKNWKkO0x;.    "
    "       ....... ..,c:'                 .ONNWMMMWO. .oOKWN0K0d,.   "
    "     ......   .';,.                   .xKXNWMWMNl',k0KXXK0Oxc'.  "
    "   ..'..  ..;::,..                     .lk0KXWMMWNNNKO0000kl;..  "
    " ..''..   ;ol:;,'..                     .lOKXWWMWNKkkkkOkxdl,..  "
    ".....    .coc;;::::,..                   .o0XXXKOxoooooxkxoc,..  "
    "....     ...',,,;;:ccc::;;,'''''''''',,,;:lddddoocc:;;:ooc:,...  "
    "          ....'''',,,;;::cccclllllooooooooolccccc:;,''',,,....   "
    "            ........'',,,,,,;;;:::cccccccccc:;;,,''........      "
    "              ...............''',,;;;;,,,',,,'........           "
    "                   .............................                 "
)

EYE2=(
    "                         ...'',;;;;::;;;,'..                     "
    "                    ..,;:cloodddxxxkkkkkkkkxol;..                "
    "                 .';codxxkkkOOOOOOOOOOOOkkkkkkxdoc,..            "
    "               .,codxkOOOO00000000OOOO0OOOOOOOOkkxddoc,..        "
    "            .':ldxkOOOOO00000000000000000000000OOOOkkxxol:'      "
    "         .,:ldxkkOOOOOO000K000000000000000K000000000Okkxkkx:.    "
    "      ..,coxkkOOOOOOOOOOOOOOOkkOOOOO0000OOOO000000000OOkxxxxl'   "
    "     .,;codxxkkOOO0O00Okkk0KK0XNWWWWWWWWWNX0kkkkkOOOOOkkxdool;.  "
    "   .';::ccldkO0KKKK0Ooc;KKKx00KNNXXXXXNNX0OO000O00Okkkkkkxoc:,.. "
    " ..''..   ;ol:;,'..                     .lOKXWWMWNKkkkkOkxdl,..  "
    ".....    .coc;;::::,..                   .o0XXXKOxoooooxkxoc,..  "
    "....     ...',,,;;:ccc::;;,'''''''''',,,;:lddddoocc:;;:ooc:,...  "
    "          ....'''',,,;;::cccclllllooooooooolccccc:;,''',,,....   "
    "            ........'',,,,,,;;;:::cccccccccc:;;,,''........      "
    "              ...............''',,;;;;,,,',,,'........           "
    "                   .............................                 "
)

EYE3=(
    "                        ...',;;:cccccccc:;,..                    "
    "                    ..,;:cccc::::ccccclloooolc;'.                "
    "                 .',;:::;;;;:loodxkOkkxxkxxdocccc;;'..           "
    "               .,;;;,,;:cox  ...WWMMMMWNNWWNNKkdolcccc:,.        "
    "            .',;;,',;lxo:   ...kMMMMMMMWNKKLlXNNkkdkoc:coo;.     "
    "         ..,;:;,,,:ldl'    ...kkWXXNWMMMMXMMddkk.XWWN0d:;lkd,    "
    "       ..,;;,,'':loc.      ..lKMMMNl.  .cOKNWNKKK;lxO0X0l,cxo,.  "
    "     ..''....'cooc.         .cONMMX;   .lOXWNOKMk. ,ddx0Ooccl:.  "
    "   ..'..  .':odc.            .x0KKKkolcldO00WNMk.  cxxxkkdl:,..  "
    " ..''..   ;dxolc;'            .lxxO0OkkxxO0WKKc. .;looolllol:'.. "
    "..'..    .':lloolc:,..          'lxkkkkkOkd,..':clc:::;,,;:;,'.. "
    "......   ....',;;;:ccc::;;,    ''',:lokdol:clllolc:;;,'........  "
    "    .     ....'''',,,;;:cccccclllloooollllccc:c:::;,'..          "
    "            .......'',,,,,,,,;;::::ccccc::::;;;,,''...           "
    "              ...............''',,,;;;,,''''''......             "
    "                   ............................                  "
)

EYE4=(
    "                         ...'',;;;;::;;;,'..                     "
    "                    ..,;:cloodddxxxkkkkkkkkxol;..                "
    "                 .';codxxkkkOOOOOOOOOOOOkkkkkkxdoc,..            "
    "               .,codxkOOOO00000000OOOO0OOOOOOOOkkxddoc,..        "
    "            .':ldxkOOOOO00000000000000000000000OOOOkkxxol:'      "
    "         .,:ldxkkOOOOOO000K000000000000000K000000000Okkxkkx:.    "
    "      ..,coxkkOOOOOOOOOOOOOOOkkOOOOO0000OOOO000000000OOkxxxxl'   "
    "     .,;codxxkkOOO0O00Okkk0KK0XNWWWWWWWWWNX0kkkkkOOOOOkkxdool;.  "
    "   .';::ccldkO0KKKK0Ooc;KKKx00KNNXXXXXNNX0OO000O00Okkkkkkxoc:,.. "
    " ..''..   ;dxolc;'            .lxxO0OkkxxO0WKKc. .;looolllol:'.. "
    "..'..    .':lloolc:,..          'lxkkkkkOkd,..':clc:::;,,;:;,'.. "
    "......   ....',;;;:ccc::;;,    ''',:lokdol:clllolc:;;,'........  "
    "    .     ....'''',,,;;:cccccclllloooollllccc:c:::;,'..          "
    "            .......'',,,,,,,,;;::::ccccc::::;;;,,''...           "
    "              ...............''',,,;;;,,''''''......             "
    "                   ............................                  "
)

EYE5=(
    "                        ...',;;:cccccccc:;,..                    "
    "                    ..,;:cccc::::ccccclloooolc;'.                "
    "                 .',;:::;;;;:loodxkOkkxxkxxdocccc;;'..           "
    "               .,;;;,,;:coxldKNWWWMMMMWNNWWNNKkdolcccc:,.        "
    "            .',;;,',;lxo:...dXWMMMMMMMMWNkloOXNNNX0koc:coo;.     "
    "         ..,;:;,,,:ldl'   .kWMMMWXXNWMMMMXd..':d0XWWN0d:;lkd,    "
    "       ..,;;,,'':loc.     lKMMMNl. .cOKNWNK:  ..';lxO0X0l,cxo,.  "
    "     ..''....'cooc.       cONMMX;   .lOXWNO;       ,ddx0Ooccl:.  "
    "   ..'..  .':odc.         .x0KKKkolcldO00xc.       .cxxxkkdl:,.. "
    " ..''..   ;dxolc;'         .lxxO0OkkxxO0kc.      .;looolllol:'.. "
    "..'..    .':lloolc:,..       'lxkkkkkOkd,   ..':clc:::;,,;:;,'.. "
    "......   ....',;;;:ccc::;;,''',:loddol:,,;:clllolc:;;,'........  "
    "    .     ....'''',,,;;:cccccclllloooollllccc:c:::;,'..          "
    "            .......'',,,,,,,,;;::::ccccc::::;;;,,''...           "
    "              ...............''',,,;;;,,''''''......             "
    "                   ............................                  "
)

EYE6=(
    "                         ...'',;;;;::;;;,'..                     "
    "                    ..,;:cloodddxxxkkkkkkkkxol;..                "
    "                 .';codxxkkkOOOOOOOOOOOOkkkkkkxdoc,..            "
    "               .,codxkOOOO00000000OOOO0OOOOOOOOkkxddoc,..        "
    "            .':ldxkOOOOO00000000000000000000000OOOOkkxxol:'      "
    "         .,:ldxkkOOOOOO000K000000000000000K000000000Okkxkkx:.    "
    "      ..,coxkkOOOOOOOOOOOOOOOkkOOOOO0000OOOO000000000OOkxxxxl'   "
    "     .,;codxxkkOOO0O00Okkk0KK0XNWWWWWWWWWNX0kkkkkOOOOOkkxdool;.  "
    "   .';::ccldkO0KKKK0Ooc;..,x00KNNXXXXXNNX0OO000O00Okkkkkkxoc:,.. "
    " ..,;,'..,oO0OOOkkxo,       ,lkKKKKKK0K0d,.;ldkOO0KKOkxxxdoc:'.. "
    "..,,'.  .,lkOxxxdol:,..       .,ldddl:,.   .,codkkOOkxdollc:,... "
    "..'.......',;:c::cclccc::;,,,',,;::::;,;;:clodddxdol:;::;'...... "
    "   .....  ...''',,,;;;:ccllloooooooooooooolllcccc:;;,....        "
    "            .......'',,,,,,;;;:::ccclllccc:::;;;,''...           "
    "              ..............'''',,;;;;;,,,''''......             "
    "                   .............................                 "
)

EYE7=(
    "                        ...',;;:cccccccc:;,..                    "
    "                    ..,;:cccc::::ccccclloooolc;'.                "
    "                 .',;:::;;;;:loodxkOkkxxkxxdocccc;;'..           "
    "               .,;;;,,;:coxldKNWWWMMMMWNNWWNNKkdolcccc:,.        "
    "            .',;;,',;lxo:dXWMMMMMMMMWNk.. loOXNNNX0koc:coo;.     "
    "         ..,;:;,,,:ldl'.kWMMMWXXNWMMMMXd..   ':d0XWWN0d:;lkd,    "
    "       ..,;;,,'':loc.  lKMMMNl. .cOKNWNK:     ..';lxO0X0l,cxo,.  "
    "     ..''....'cooc.    cONMMX;   .lOXWNO;          ,ddx0Ooccl:.  "
    "   ..'..  .':odc.      .x0KKKkolcldO00xc.          .cxxxkkdl:,.. "
    " ..''..   ;dxolc;'      .lxxO0OkkxxO0kc.         .;looolllol:'.. "
    "..'..    .':lloolc:,..    'lxkkkkkOkd,      ..':clc:::;,,;:;,'.. "
    "......   ....',;;;:ccc::;;,,:loddol:,,.,,;:clllolc:;;,'........  "
    "    .     ....'''',,,;;:cccccclllloooollllccc:c:::;,'..          "
    "            .......'',,,,,,,,;;::::ccccc::::;;;,,''...           "
    "              ...............''',,,;;;,,''''''......             "
    "                   ............................                  "
)

EYE8=(
    "                         ...'',;;;;::;;;,'..                     "
    "                    ..,;:cloodddxxxkkkkkkkkxol;..                "
    "                 .';codxxkkkOOOOOOOOOOOOkkkkkkxdoc,..            "
    "               .,codxkOOOO00000000OOOO0OOOOOOOOkkxddoc,..        "
    "            .':ldxkOOOOO00000000000000000000000OOOOkkxxol:'      "
    "         .,:ldxkkOOOOOO000K000000000000000K000000000Okkxkkx:.    "
    "      ..,coxkkOOOOOOOOOOOOOOOkkOOOOO0000OOOO000000000OOkxxxxl'   "
    "     .,;codxxkkOOO0O00Okkk0KK0XNWWWWWWWWWNX0kkkkkOOOOOkkxdool;.  "
    "   .';::ccldkO0KKKK0Ooc;KKKx00KNNXXXXXNNX0OO000O00Okkkkkkxoc:,.. "
    " ..''..   ;dxolc;'      .lxxO0OkkxxO0kc.         .;looolllol:'.. "
    "..'..    .':lloolc:,..    'lxkkkkkOkd,      ..':clc:::;,,;:;,'.. "
    "......   ....',;;;:ccc::;;,,:loddol:,,.,,;:clllolc:;;,'........  "
    "    .     ....'''',,,;;:cccccclllloooollllccc:c:::;,'..          "
    "            .......'',,,,,,,,;;::::ccccc::::;;;,,''...           "
    "              ...............''',,,;;;,,''''''......             "
    "                   ............................                  "
)

EYE9=(
    "                        ...'',;;;;:::;;,,'..                     "
    "                    .';:colllloodxxxkxkkkkkdo:,..                "
    "                 .,:ldxkO0OOOOkxkkO00O0NNNXXKOxdl:,'..           "
    "              ..;cdOXNNNWWNO:.        .;cllx0KKKKKkdoc:,..       "
    "           ..;codOXWMMMMMMMW0;               .,okKNWNKxlccc,.    "
    "        ..;ldxxOXWO:,oNMMMMMWk.                 .'ckKXNKxlcoo,   "
    "      ..;ldxxxONMN;  .OWMMMMMX'                    .cdkKXOlcol'  "
    "    ..;codollONMMWk'.lNMMMMMW0'                     .cxxO0Ooc:,. "
    "   .,:cllc:cxKNWNWMWWWMMMWNXO;                      .okkxdxdo:'. "
    " .':clc:,,cx0K00xkKNNNWWXKkc.                    ..;loooc::ll:,.."
    ".,:cc;,...:odxkkkxddl::::,.                 ..';:cc:;:c:;,',''..."
    ".';;;,'..',,;:ccccllllc::;,,''''''''',,,,;:ccllllc:;,,'.....   .."
    " ..........''',,,;;;;:::cllllllolllllloolllllcc:::;,'...         "
    "        ..........',,,;;;;;;;;:cccccccccc::::;;,,''...           "
    "             .........''''''''',,;;;;;,,,'''''......             "
    "                   .............................                 "
)

EYE10=(
    "                         ...'',;;;;::;;;,'..                     "
    "                    ..,;:cloodddxxxkkkkkkkkxol;..                "
    "                 .';codxxkkkOOOOOOOOOOOOkkkkkkxdoc,..            "
    "               .,codxkOOOO00000000OOOO0OOOOOOOOkkxddoc,..        "
    "            .':ldxkOOOOO00000000000000000000000OOOOkkxxol:'      "
    "         .,:ldxkkOOOOOO000K000000000000000K000000000Okkxkkx:.    "
    "      ..,coxkkOOOOOOOOOOOOOOOkkOOOOO0000OOOO000000000OOkxxxxl'   "
    "     .,;codxxkkOOO0O00Okkk0KK0XNWWWWWWWWWNX0kkkkkOOOOOkkxdool;.  "
    "   .';::ccldkO0KKKK0OoccKKKK00KNNXXXXXNNX0OO000O00Okkkkkkxoc:,.. "
    " .':clc:,,cx0K00xkKNNNWWXKkc.OKNNX               ..;loooc::ll:,.."
    ".,:cc;,...:odxkkkxddl::::,.                 ..';:cc:;:c:;,',''..."
    ".';;;,'..',,;:ccccllllc::;,,''''''''',,,,;:ccllllc:;,,'.....   .."
    " ..........''',,,;;;;:::cllllllolllllloolllllcc:::;,'...         "
    "        ..........',,,;;;;;;;;:cccccccccc::::;;,,''...           "
    "             .........''''''''',,;;;;;,,,'''''......             "
    "                   .............................                 "
)

EYE_CLOSED=(
    "                         ...'',;;;;;;;,,...                      "
    "                    ..,:loxkkOOO000KKKKKK0Oxdc,..                "
    "                 .,coxO00KXXXXXXXXXXXXXXXXXXXK0Oxo:,..           "
    "              ..;lxO00KKKKK000000000000000KKKKXXXXK0Oxl;..       "
    "           ..,:oxkO0OO0OOOOOOOOOOOOOOOOOOOOOOO0000KKKKKKOd:.     "
    "        ..;codxkkOOOkkkkkkkxxxxxxxxxxxxxxxxkkkkkkOOOO00KK0kl'    "
    "      ..;ldxkkkkkkxxxxxddddddddddddddddddddddddxxxxxxkkkOOOxc.   "
    "    ..,:oxxkkkkkxxxxdddddddddddddddddddddddddddddddddxxkkkkxl;.  "
    "  ..,;codxxkkkxxddddddddddddddddddddddddddddddddxdxxxkOOOkxdo:.. "
    " .';::::cldkOOOkkkxxxxxxdddddddddddddddddddddxxxxxkkOOOOkxddl;.. "
    ".';:;,..,ckXXXKKK0KK00OkxkOdoddxxdddddddxxxxxxkkOOOOkkkkkxdoc,.. "
    ".',,''..,:oxxxxxxxkkxkkxkOOxxk000OOO000000KKKKKKK00Okxdllll:,..  "
    " .........',,,:ccllllooooxkxxxO0Okk000O0000000O00OOkxdoc,'...    "
    "         ......',;;::cc::clllloddooxOxdxxkxxxxddollllc:'.        "
    "              .....'',,,,,,,;;;;;::cllc::ccc::;;,,,'...          "
    "                  ..................'''..'''......               "
)


function draw_string_array {
    # Many thanks to https://askubuntu.com/a/674347
    eye=("$@")
    for string in "${eye[@]}"
    do
        echo "$string"
    done
}


function beep {
    play --null --channels 1 \
    synth .15 triangle $(shuf -i 420-460 -n 1) \
    gain -18 \
    2> /dev/null &
}


function delay_long {
    if test -x "$(command -v bc)"
    then
        # Random float [1.0;5.0]
        echo "$(shuf -i 10-50 -n 1)/10" | bc -l
    else
        # Random int [1;5]
        shuf -i 1-5 -n 1
    fi
}

function finish {
  # Restore cursor
  tput cnorm
}

trap finish EXIT

DELAY_SHORT=0.15

# Without cleaning, the drawing breaks, maybe because of '\n' in $PS1
# TODO: get rid of it
tput clear

tput civis  # Hide cursor
tput sc     # Save cursor position; restore later by `tput rc`
tput bold   # Not sure, but looks better

# Initial straight look
draw_string_array "${EYE_CLOSED[@]}" ; sleep $DELAY_SHORT  ; tput rc
draw_string_array "${EYE6[@]}"       ; sleep $DELAY_SHORT  ; tput rc ; beep
draw_string_array "${EYE5[@]}"       ; sleep $(delay_long) ; tput rc
draw_string_array "${EYE6[@]}"       ; sleep $DELAY_SHORT  ; tput rc ; beep

# Blinking
while :
do
    draw_string_array "${EYE_CLOSED[@]}" ; sleep $DELAY_SHORT  ; tput rc
    #TODO: Should select random eye direction
    draw_string_array "${EYE6[@]}"       ; sleep $DELAY_SHORT  ; tput rc ; beep
    draw_string_array "${EYE5[@]}"       ; sleep $(delay_long) ; tput rc
    draw_string_array "${EYE6[@]}"       ; sleep $DELAY_SHORT  ; tput rc ; beep
done

tput sgr0
