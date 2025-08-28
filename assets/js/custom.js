/* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */

// CLOCK
document.addEventListener("DOMContentLoaded", function () {
    const dateEl = document.getElementById('date');
    const dateIcon = document.getElementById('dateIcon');
    const clockEl = document.getElementById('clock');
    const timeIcon = document.getElementById('timeIcon');

    function update() {
        const now = new Date();
        const fullDate = now.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
        const timeStr = now.toTimeString().slice(0, 8); // HH:MM:SS

        if (dateEl) dateEl.textContent = fullDate;
        if (clockEl) clockEl.textContent = timeStr;
        if (dateIcon) dateIcon.title = fullDate;
        if (timeIcon) timeIcon.title = timeStr;
    }

    update(); // initial
    setInterval(update, 1000); // update every second
});

// Fullscreen
function toggleFullscreen() {
    if (!document.fullscreenElement &&
        !document.webkitFullscreenElement &&
        !document.msFullscreenElement) {
        // Enter Fullscreen
        var elem = document.documentElement;
        if (elem.requestFullscreen) {
            elem.requestFullscreen();
        } else if (elem.webkitRequestFullscreen) {
            elem.webkitRequestFullscreen(); // Safari
        } else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen(); // IE11
        }
    } else {
        // Exit Fullscreen
        if (document.exitFullscreen) {
            document.exitFullscreen();
        } else if (document.webkitExitFullscreen) {
            document.webkitExitFullscreen(); // Safari
        } else if (document.msExitFullscreen) {
            document.msExitFullscreen(); // IE11
        }
    }
}
// Basic cookie storage helper
const CookieStore = {
    set(key, value, days = 365) {
        const expires = new Date(Date.now() + days * 864e5).toUTCString();
        document.cookie = `${encodeURIComponent(key)}=${encodeURIComponent(value)}; expires=${expires}; path=/`;
    },
    get(key) {
        return document.cookie
            .split('; ')
            .find(row => row.startsWith(key + '='))
            ?.split('=')[1];
    }
};

document.addEventListener('DOMContentLoaded', () => {
    const menu = document.getElementById('sideBar'); // Replace with your actual ID

    // Restore saved class from cookie
    const savedState = CookieStore.get('menuState');
    if (savedState === 'sidebar-main-resized') {
        menu.classList.add('sidebar-main-resized');

        // Trigger reflow-sensitive components (like charts/grids)
        setTimeout(() => {
            window.dispatchEvent(new Event('resize'));
        }, 100); // small delay ensures layout updates
    }

    // 2️ Observe class change passively
    const observer = new MutationObserver(() => {
        const isOpen = menu.classList.contains('sidebar-main-resized');
        CookieStore.set('menuState', isOpen ? 'sidebar-main-resized' : 'closed');
    });

    observer.observe(menu, {
        attributes: true,
        attributeFilter: ['class']
    });
});

// Create a new Date object
const today = new Date();

// Format the date: example - 02 July 2025
const options = { day: '2-digit', month: 'long', year: 'numeric' };
const formattedDate = today.toLocaleDateString('en-GB', options);

// Show it in the paragraph
document.getElementById('date').innerText = formattedDate;