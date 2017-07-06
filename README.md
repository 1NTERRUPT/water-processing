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
 1. Operate: Turn off or on (max %)
 1. Admin: Set arbitrary percent
 1. API read only, no auth
