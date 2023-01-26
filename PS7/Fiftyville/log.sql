-- Keep a log of any SQL queries you execute as you solve the mystery.
-- Check report from crime
SELECT * FROM crime_scene_reports WHERE street = 'Humphrey Street' AND year = 2021 AND month = 7 AND day = 28;
-- Check what wittness have to say
SELECT * FROM interviews WHERE year = 2021 AND month = 7 AND day = 28 AND transcript LIKE '%bakery%';
-- Check what cars where there whene crime took place after 10 minutes from
SELECT * FROM bakery_security_logs WHERE hour = 10 AND minute > 15 AND minute < 25 AND year = 2021 AND month = 7 AND day = 28 AND activity = 'exit';
-- First fligth in the morning
SELECT id FROM flights WHERE origin_airport_id = 8 AND year = 2021 AND month = 7 AND day = 29 AND hour = (SELECT MIN(hour)FROM flights WHERE origin_airport_id = 8 AND year = 2021 AND month = 7 AND day = 29);
-- PASSPORT OWNER who called and where as wittness testified
SELECT passport_number FROM people WHERE phone_number in
(SELECT caller FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller in
(SELECT phone_number FROM people WHERE id in
(SELECT person_id FROM bank_accounts WHERE account_number in
(SELECT account_number FROM atm_transactions WHERE atm_location = 'Leggett Street' AND year = 2021 AND month = 7 AND day = 28 AND account_number in
(SELECT account_number from  bank_accounts WHERE person_id in
(SELECT id FROM people WHERE license_plate in
(SELECT license_plate FROM bakery_security_logs WHERE hour = 10 AND minute > 15 AND minute < 25 AND year = 2021 AND month = 7 AND day = 28 AND activity = 'exit'))))))
AND duration < 60);
-- Check if any of them were on first fligth
SELECT passport_number FROM passengers WHERE flight_id = 36 AND passport_number in(SELECT passport_number FROM people WHERE phone_number in
(SELECT caller FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller in
(SELECT phone_number FROM people WHERE id in
(SELECT person_id FROM bank_accounts WHERE account_number in(SELECT account_number FROM atm_transactions WHERE atm_location = 'Leggett Street' AND year = 2021 AND month = 7 AND day = 28 AND account_number in
(SELECT account_number from  bank_accounts WHERE person_id in
(SELECT id FROM people WHERE license_plate in(SELECT license_plate FROM bakery_security_logs WHERE hour = 10 AND minute > 15 AND minute < 25 AND year = 2021 AND month = 7 AND day = 28 AND activity = 'exit'))))))
AND duration < 60));
-- Check who owns 5773159633
SELECT * FROM people WHERE passport_number = 5773159633;
-- Check who helped him
SELECT * FROM people WHERE phone_number = (SELECT receiver FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND caller = '(367) 555-5533' AND duration < 60);
