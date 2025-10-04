function typewrite
    for arg in $argv
        for i in (seq (string length $arg))
            echo -n (string sub -s $i -l 1 $arg)
            sleep 0.01
        end
    end
    echo ""
end
function fish_greeting
	typewrite "" 
	typewrite " Hello, " (whoami) "!"
	typewrite " Welcome back! Today is " (date '+%A, %B %d, %Y') "."
	typewrite " Remember, every day is a new opportunity to shine! 🚀"
	typewrite ""
end
#OhMyPosh theme
oh-my-posh init fish --config $HOME/.poshthemes/montys.omp.json | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end
