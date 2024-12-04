#!/bin/bash

echo "========================================="
echo "         [ SCRIPT DE OTIMIZAÇÃO ]  "
echo "             😈 por Rhyan57              "
echo "========================================="
echo "[🟢 SUCESSO] Script iniciado com sucesso!"
echo "[ 😈 ] Iniciando processos de otimização e desativação..."

log_sucesso() {
    echo "[🟢 SUCESSO] $1"
}

log_erro() {
    echo "[🔴 ERRO] $1"
}

# Limpeza de Cache
echo "[ 🟠 LOG ] INICIANDO LIMPEZA DE CACHE..."

limpar_cache() {
    pm clear "$1" && log_sucesso "Cache limpo para $1 [$2]" || log_erro "Falha ao limpar cache para $1"
}

pacotes_cache=(
    "com.google.android.gms"
    "com.google.pixeltips"
    "com.google.playground"
    "com.google.pixelwallpaper"
    "com.google.pixelbuds"
    "com.google.android.videos"
    "com.google.android.soundsearch"
    "com.google.android.soundamplifier"
    "com.google.android.personalsafety"
    "com.google.android.recorder"
    "com.google.android.apps.books"
    "com.google.android.duo"
    "com.google.android.apps.googleassistant"
    "com.google.android.calendar"
    "com.google.android.apps.docs"
    "com.google.android.apps.photos"
    "com.google.android.apps.maps"
    "com.google.android.gm"
    "com.google.android.music"
    "com.google.android.youtube"
    "com.google.android.youtube.tv"
    "com.google.android.youtube.go"
    "com.google.android.apps.wellbeing"
    "com.google.android.apps.youtube.music"
    "com.google.android.apps.magazines"
    "com.google.android.apps.turbo"
    "com.google.android.apps.inputmethod.latin"
    "com.android.chrome"
    "com.android.vending"
    "com.android.email"
    "com.android.bips"
    "com.android.calllogbackup"
    "com.android.dreams.basic"
    "com.android.dreams.phototable"
    "com.google.android.contacts"
    "com.android.deskclock"
    "com.android.wallpaper.livepicker"
    "com.android.providers.partnerbookmarks"
)

for i in "${!pacotes_cache[@]}"; do
    limpar_cache "${pacotes_cache[i]}" "$((i+1))%"
done

# Limpeza de Dados
echo "[ 🟠 LOG ] INICIANDO LIMPEZA DE DADOS..."

limpar_dados() {
    pm clear "$1" && log_sucesso "Dados limpos para $1" || log_erro "Falha ao limpar dados para $1"
}

for pacote in "${pacotes_cache[@]}"; do
    limpar_dados "$pacote"
done

# Desativação de Apps
echo "[ 🟠 LOG ] DESATIVANDO APPS..."

desativar_app() {
    pm disable-user --user 0 "$1" && log_sucesso "App desativado $1 [$2]" || log_erro "Falha ao desativar app $1"
}

pacotes_desativar=(
    "com.google.pixeltips"
    "com.google.playground"
    "com.google.pixelwallpaper"
    "com.google.pixelbuds"
    "com.google.android.videos"
    "com.google.android.soundsearch"
    "com.google.android.soundamplifier"
    "com.google.android.personalsafety"
    "com.google.android.recorder"
    "com.google.android.apps.books"
    "com.google.android.duo"
    "com.google.android.apps.googleassistant"
    "com.google.android.calendar"
    "com.google.android.apps.docs"
    "com.google.android.apps.photos"
    "com.google.android.apps.maps"
    "com.google.android.gm"
    "com.google.android.music"
    "com.google.android.youtube"
    "com.google.android.youtube.tv"
    "com.google.android.youtube.go"
    "com.google.android.apps.wellbeing"
    "com.google.android.apps.youtube.music"
    "com.google.android.apps.magazines"
    "com.google.android.apps.turbo"
    "com.google.android.apps.inputmethod.latin"
    "com.android.chrome"
    "com.android.vending"
    "com.android.email"
    "com.android.bips"
    "com.android.calllogbackup"
    "com.android.dreams.basic"
    "com.android.dreams.phototable"
    "com.android.deskclock"
    "com.android.wallpaper.livepicker"
    "com.android.providers.partnerbookmarks"
    "com.samsung.android.kidsinstaller"
)

for i in "${!pacotes_desativar[@]}"; do
    desativar_app "${pacotes_desativar[i]}" "$((i+1))%"
done

echo "[ 🟠 LOG ] DESLIGANDO SERVIÇOS DESNECESSÁRIOS..."

desligar_servico() {
    settings put global "$1" 0 && log_sucesso "Serviço $1 desligado" || log_erro "Falha ao desligar serviço $1"
}

servicos_desligar=(
    "wifi_on"
    "mobile_data"
    "bluetooth_on"
    "nfc_on"
    "location_mode"
    "sync"
    "auto_time"
    "auto_time_zone"
    "airplane_mode_on"
    "adaptive_battery_management_enabled"
    "backup_enabled"
    "data_roaming"
    "development_settings_enabled"
    "network_recommendations_enabled"
    "zen_mode"
    "vibration_on"
    "charging_sounds_enabled"
    "screensaver_enabled"
    "show_password"
    "smart_lock_mode"
    "auto_restore"
    "find_my_device"
    "show_ime_with_hard_keyboard"
    "night_display_activated"
    "sound_effects_enabled"
    "dock_sounds_enabled"
    "lock_screen_allow_remote_input"
    "trusted_sound_enabled"
    "sensors_off"
    "screen_brightness_mode"
    "dnd_mode"
    "enhanced_4g_lte_mode_enabled"
    "battery_saver_mode"
    "app_standby_enabled"
    "background_data_enabled"
    "auto_rotate"
)

for servico in "${servicos_desligar[@]}"; do
    desligar_servico "$servico"
done

echo "[ 🟠 LOG ] CONFIGURANDO OPÇÕES DE DESENVOLVEDOR..."

configurar_opcao_desenvolvedor() {
    settings put global "$1" "$2" && log_sucesso "Opção $1 configurada para $2" || log_erro "Falha ao configurar opção $1"
}

configurar_opcao_desenvolvedor "window_animation_scale" 0
configurar_opcao_desenvolvedor "transition_animation_scale" 0
configurar_opcao_desenvolvedor "animator_duration_scale" 0
configurar_opcao_desenvolvedor "show_touches" 0
configurar_opcao_desenvolvedor "pointer_location" 0
configurar_opcao_desenvolvedor "wifi_scan_always_enabled" 0
configurar_opcao_desenvolvedor "assist_structure_enabled" 0
configurar_opcao_desenvolvedor "user_full_data_backup" 0
configurar_opcao_desenvolvedor "package_verifier_enable" 0
configurar_opcao_desenvolvedor "instant_apps_enabled" 0
configurar_opcao_desenvolvedor "auto_fill_enabled" 0
configurar_opcao_desenvolvedor "always_on_display" 0

echo "[ 🟠 LOG ] REINICIANDO SERVIÇO DE REDE..."

reiniciar_servico_rede() {
    ifconfig wlan0 down && ifconfig wlan0 up && log_sucesso "Serviço de rede reiniciado" || log_erro "Falha ao reiniciar serviço de rede"
}

reiniciar_servico_rede

echo "[ 🟠 LOG ] CONFIGURANDO NOTIFICAÇÕES PUSH..."

configurar_notificacoes_push() {
    settings put global "$1" "$2" && log_sucesso "Notificações Push configuradas para $1" || log_erro "Falha ao configurar Notificações Push para $1"
}

configurar_notificacoes_push "notification_enabled" 1
