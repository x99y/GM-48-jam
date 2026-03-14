function safe_real(str, fallback=0){
    try {
        return real(str);
    } catch (_) {
        return fallback;
    }
}