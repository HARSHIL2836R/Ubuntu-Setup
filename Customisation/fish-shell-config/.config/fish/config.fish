oh-my-posh init fish --config $HOME/.poshthemes/montys.omp.json | source
function fish_greeting
    echo "Hello, " (whoami) "!"
    echo "Welcome back! Today is " (date '+%A, %B %d, %Y') "."
    echo "Remember, every day is a new opportunity to shine! 🚀"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
