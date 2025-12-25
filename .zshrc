# =============================================================================    
# PATH CONFIGURATION    
# =============================================================================    
    
# If you come from bash you might have to change your $PATH.            
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH            
    
# Path to your Oh My Zsh installation.            
export ZSH="$HOME/.oh-my-zsh"    
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"    
export PATH="$HOME/.local/bin:$PATH"    
    
# =============================================================================    
# OH-MY-ZSH CONFIGURATION    
# =============================================================================    
    
ZSH_THEME="Soliah"    
    
# PLUGINS        
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)    
    
source $ZSH/oh-my-zsh.sh    
    
# =============================================================================    
# COMPLETION SYSTEM    
# =============================================================================    
    
# Initialize completion system (must be after oh-my-zsh)    
autoload -Uz compinit && compinit    
    
# =============================================================================    
# KUBERNETES CONFIGURATION    
# =============================================================================    
    
# Safe KUBECONFIG setup - only set if config files exist    
kube_config_files=(~/.kube/config ~/.kube/*config.yaml(N))    
if [[ ${#kube_config_files[@]} -gt 0 ]]; then    
    export KUBECONFIG=${(j|:|)kube_config_files}    
fi    
    
# kubectl autocomplete    
#if command -v kubectl >/dev/null 2>&1; then    
#    source <(kubectl completion zsh)    
#    compdef __start_kubectl kubectl    
#fi    
source <(kubectl completion zsh)

# =============================================================================    
# CUSTOM FUNCTIONS    
# =============================================================================    
    
# Загрузка пользовательских функций             
fpath=(~/.config/zsh_functions $fpath)    
autoload -Uz ggc ggca ggp gga kube-switch    
    
# =============================================================================    
# SSH CONFIGURATION    
# =============================================================================    
    
ssh-add ~/.ssh/id_ed25519 2>/dev/null    
    
# =============================================================================    
# TOOLS INITIALIZATION    
# =============================================================================    
    
eval "$(zoxide init zsh --cmd cd)"    
    
# =============================================================================    
# ALIASES    
# =============================================================================    
    
alias v="~/.dotfiles/.soft/nvim-linux64/bin/nvim"    
alias sv="sudo -E ~/.dotfiles/.soft/nvim-linux64/bin/nvim"    
alias l="lsd -l"    
alias ll="lsd -al"    
alias c="clear"    
alias f="fg %"    
alias sudo="sudo -E"    
alias sl="lsd -lr"    
alias sla="lsd -alr"    
alias bat="batcat"    
alias open="explorer.exe"    
alias openf='explorer.exe "$(wslpath -w "$PWD")"'    
alias codef='code "$PWD"'    
alias copy="win32yank.exe -i"    
alias ipa="ip -br a"    
alias gs="git status"    
alias gga="git add"    
    
alias ks="kube-switch"    
alias kl="kube-list"    
alias ku="kube-use"    
    
# =============================================================================    
# CUSTOM PROMPT WITH KUBECONFIG (RIGHT SIDE)    
# =============================================================================    
    
# Функция для получения имени текущего kubeconfig    
function get_kubeconfig_name() {    
    if [[ -n "$KUBECONFIG" ]]; then    
        # Если KUBECONFIG содержит несколько путей, берем первый    
        local first_config=${KUBECONFIG%%:*}    
        local config_name=$(basename "$first_config")    
        # Убираем расширения .yaml и .yml    
        config_name="${config_name%.yaml}"    
        config_name="${config_name%.yml}"    
        # Убираем 'config' если это дефолтный конфиг    
        if [[ "$config_name" == "config" ]]; then    
            config_name=""    
        fi    
        echo "$config_name"    
    fi                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
# Kubeconfig справа фиолетовым цветом                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
RPROMPT='%F{99}$(get_kubeconfig_name)%f' 
