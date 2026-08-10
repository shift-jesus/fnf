local blockCountdown = true

function onStartCountdown()
    if blockCountdown then
        return Function_Stop
    end
end

function onCreatePost()
    playAnim('dad', 'Rspin', true)
    setProperty('dad.specialAnim', true)
    runTimer('rspinDone', 4.04, 1)
    runTimer('idleLoop', 0.45, 0) -- 0 = se repite indefinidamente
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'idleLoop' then
        characterDance('boyfriend')
        characterDance('gf')
    elseif tag == 'rspinDone' then
        playAnim('dad', 'spin', true)
        setProperty('dad.specialAnim', true)
        runTimer('spinDone', 0.29, 1)
    elseif tag == 'spinDone' then
        playAnim('dad', 'singRIGHT', true)
        setProperty('dad.specialAnim', true)
        playSound('aow', 1)
        runTimer('rightDone', 0.37, 1)
    elseif tag == 'rightDone' then
        setProperty('dad.specialAnim', false)
        cancelTimer('idleLoop') -- ya no hace falta, el conteo se encarga de ahí en adelante
        blockCountdown = false
        startCountdown()
    end
end