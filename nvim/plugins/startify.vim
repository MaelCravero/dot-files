let g:startify_custom_header = [
        \ "                                                           ,.                 ",
        \ "                                                .          :%%%.    .%%%.      ",
        \ "                                           __%%%(\\        `%%%%%   .%%%%%      ",
        \ "                                         /a  ^  '%        %%%% %: ,%  %%\"`     ",
        \ "                                        '__..  ,'%     .-%:     %-'    %       ",
        \ "                                         ~~\"\"%:. `     % '          .   `.     ",
        \ "                                             %% % `   %%           .%:  . \\.   ",
        \ "                                              %%:. `-'   `        .%% . %: :\\  ",
        \ "                                              %(%,%...\"   `%,     %%'   %% ) ) ",
        \ "                                               %)%%)%%'   )%%%.....- '   \"/ (  ",
        \ "                         _                     %a:f%%\\ % / \\`%  \"%%% `   / \\\\)) ",
        \ "                        (_)                     %(%'  % /-. \\      '  \\ |-. '. ",
        \ "   _ __   ___  _____   ___ _ __ ___             `'    |%   `()         \\|  `() ",
        \ "  | '_ \\ / _ \\/ _ \\ \\ / / | '_ ` _ \\                  ||    /          ()   /  ",
        \ "  | | | |  __/ (_) \\ V /| | | | | | |                 ()   0            |  o   ",
        \ "  |_| |_|\\___|\\___/ \\_/ |_|_| |_| |_|                  \\  /\\            o /    ",
        \ "                                                       o  `            /-|     ",
        \ "                                                    ,-/ `           ,-/        ",
        \]

" Save sessions in current working dir to load them automatically
" let g:startify_session_dir = "$PWD"

"let g:startify_session_dir = "$PWD/.vim-sessions"

let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files', 'header': ['     Files'] },
            \ { 'type': 'dir', 'header': ['     Current dir'.getcwd()] },
            \ { 'type': 'bookmarks', 'header': ['     Bookmarks'] },
            \]

let g:startify_bookmarks = [
            \ {'.': '~/.config/nvim/init.vim'},
            \ {'p': '~/.config/nvim/plugins.vim'},
            \ {'k': '~/.config/nvim/keys.vim'},
            \ {'c': '~/.vimrc'},
            \ {'z': '~/.zshrc'},
            \ {'i': '~/.config/i3/config'},
            \ {'b': '~/.config/bspwm/bspwmrc'},
            \ {'s': '~/.config/sxhkd/sxhkdrc'},
            \]

let g:startify_files_number = 5

let g:startify_fortune_use_unicode = 1

let g:startify_change_to_vcs_root = 1

let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

" Sort sessions by last modification
let g:startify_session_sort = 1

let g:webdevicons_enable_startify = 1
