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
      # Используем базовый профиль вместо gpu-hq, чтобы не было конфликтов с wayland
      profile = "gpu";

      # Принудительно используем Wayland контекст (важно для Niri)
      gpu-context = "wayland";

      # Отключаем интерполяцию кадров (снижает нагрузку и фризы при перемотке)
      interpolation = "no";

      # Видеовывод
      vo = "gpu";

      # Настройка масштабирования для плавного и качественного видео (без перегруза)
      scale = "bilinear";
      cscale = "bilinear";
      dither-depth = "8";

      # Аппаратное декодирование (оставляем, но добавляем защиту от сбоев)
      hwdec = "auto-safe";
      hwdec-codecs = "all";

      # Стабильность при перемотке
      demuxer-readahead-secs = "30"; # Буфер для быстрых перемоток
      cache = "yes";
      cache-secs = "120";

      # Удобство интерфейса
      keep-open = "yes";
      save-position-on-quit = true;

      # Опции для UI скриптов
      script-opts-append = "uosc-destination_time=no,uosc-total_time=no,uosc-time_remaining=no,uosc-animation_duration=100,uosc-autohide=yes,thumbfast-hwdec=yes,thumbfast-max_height=250";
    };
  };
}
