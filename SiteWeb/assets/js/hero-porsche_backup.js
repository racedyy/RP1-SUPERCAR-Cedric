/**
 * Porsche Hero Intro Animation Script
 * Handles tire burnout, smoke particle generation, high speed launch, and hero reveal.
 */
document.addEventListener('DOMContentLoaded', function () {
    const overlay = document.getElementById('porscheHeroOverlay');
    const heroContent = document.querySelector('.hero-content');
    const smokeEmitter = document.getElementById('smokeEmitter');
    const replayBtn = document.getElementById('btnReplayPorsche');

    if (!overlay) return;

    let smokeInterval = null;

    function startPorscheAnimation() {
        // Reset overlay state and display
        overlay.style.display = 'flex';
        overlay.classList.remove('hero-revealed', 'revving', 'launching');
        
        // Ensure hero text starts hidden while car burns out
        if (heroContent) {
            heroContent.style.opacity = '0';
            heroContent.style.transform = 'translateY(30px)';
            heroContent.style.transition = 'none';
        }

        // Clear previous smoke particles
        if (smokeEmitter) smokeEmitter.innerHTML = '';
        if (smokeInterval) clearInterval(smokeInterval);

        // --- Phase 1: Burnout / Revving (tires spin + smoke puffs) ---
        setTimeout(() => {
            overlay.classList.add('revving');

            // Generate continuous smoke particles behind rear tire
            smokeInterval = setInterval(() => {
                if (!overlay.classList.contains('revving') && !overlay.classList.contains('launching')) {
                    clearInterval(smokeInterval);
                    return;
                }
                createSmokeParticle();
            }, 55);

        }, 150);

        // --- Phase 2: Launch / Full speed acceleration to the right (at t = 2.0s) ---
        setTimeout(() => {
            overlay.classList.remove('revving');
            overlay.classList.add('launching');
            
            // Add speed streaks
            spawnSpeedStreaks();

            // Burst of extra smoke at launch moment
            for (let i = 0; i < 6; i++) {
                setTimeout(createSmokeParticle, i * 25);
            }
        }, 2000);

        // --- Phase 3: Porsche exits right of screen -> Reveal Hero Image (at t = 2.9s) ---
        setTimeout(() => {
            if (smokeInterval) clearInterval(smokeInterval);
            overlay.classList.add('hero-revealed');

            // Animate hero title and button into view smoothly
            if (heroContent) {
                heroContent.style.transition = 'opacity 0.8s ease-out, transform 0.8s ease-out';
                heroContent.style.opacity = '1';
                heroContent.style.transform = 'translateY(0)';
            }
        }, 2900);

        // Disable overlay completely after animation finishes (at t = 3.6s)
        setTimeout(() => {
            overlay.style.display = 'none';
        }, 3650);
    }

    // Helper: Create single smoke puff particle
    function createSmokeParticle() {
        if (!smokeEmitter) return;
        const particle = document.createElement('div');
        particle.className = 'smoke-particle';
        
        // Random offset for natural smoke cloud spreading
        const offsetX = (Math.random() - 0.5) * 14;
        const offsetY = (Math.random() - 0.5) * 12;
        const scale = 0.6 + Math.random() * 0.5;
        
        particle.style.left = `${offsetX}px`;
        particle.style.top = `${offsetY}px`;
        particle.style.transform = `scale(${scale})`;

        smokeEmitter.appendChild(particle);

        // Remove after animation completes
        setTimeout(() => {
            particle.remove();
        }, 1100);
    }

    // Helper: Spawn speed streaks behind Porsche during launch
    function spawnSpeedStreaks() {
        const carStage = overlay.querySelector('.porsche-car-stage');
        if (!carStage) return;

        for (let i = 0; i < 4; i++) {
            const streak = document.createElement('div');
            streak.className = 'speed-streak';
            streak.style.top = `${25 + i * 22 + Math.random() * 8}px`;
            streak.style.left = `${-30 - Math.random() * 40}px`;
            carStage.appendChild(streak);

            setTimeout(() => streak.remove(), 450);
        }
    }

    // Launch animation automatically when page loads
    startPorscheAnimation();

    // Support manual replay button
    if (replayBtn) {
        replayBtn.addEventListener('click', function () {
            startPorscheAnimation();
        });
    }
});
