# Water purification

## App Constants
 - [x] Max processing rate
 - [x] Stable temp
 - [x] Over max temp increase
 - [x] Under max temp decrease
 - [x] Refill per percent
 - [x] Deplete rate

## Pump State
 1. created_at
 1. running percent (integer 0-100)
 1. pump temp (integer) 
 1. pump reserves (integer)

## Updates
 1. Cron job to update every minute through Active Job

## Routes 
 1. Monitor: view current state
   * Current reserves
   * Engine Rate
   * Temp 
   * Warnings
     * Approx time to empty if off
     * Approx time overheat
     * Approx time until restart
 1. Operate: Turn off or on (max %)
   * Same as monitor plus
   * Turn on/Turn off toggle
 1. API read only, no auth
