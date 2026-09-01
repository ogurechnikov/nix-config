{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    # Системные или сторонние пакеты скриптов/плагинов
    scripts = [
      pkgs.mpvScripts.mpris # Интеграция с медиа-ключами системы (Mpris)
      pkgs.mpvScripts.uosc # Современный минималистичный интерфейс (UI)
    ];

    # Настройки плеера (эквивалент mpv.conf)
    config = {
      profile = "gpu-hq"; # Высокое качество рендеринга
      hwdec = "auto-safe"; # Безопасное аппаратное ускорение видео
      vo = "gpu"; # Видеовывод через GPU
      keep-open = "yes"; # Не закрывать плеер после окончания видео
      save-position-on-quit = true; # Запоминать, где остановился просмотр
      script-opts-append = "uosc-destination_time=no,uosc-total_time=no,uosc-time_remaining=no,uosc-animation_duration=100,uosc-autohide=yes,thumbfast-hwdec=yes,thumbfast-max_height=250";
    };
  };
}
