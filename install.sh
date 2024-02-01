install_bash_config="source ~/.bash-config/main.sh"
if grep -q "$install_bash_config" ~/.bashrc
then
    echo -e "\033[01;32mBash Configuration already installed!\033[0m"
else
    echo -e "\033[01;36mInstalling Bash configurations..\033[0m"
    printf "\n# Load Bash Configurations\n$install_bash_config\n" >> ~/.bashrc
    echo -e "\033[01;32mInstalled successfully!\033[0m"
    echo -e "\033[01;97mStart a new session or execute \"source ~/.bashrc\"\033[0m"
fi
