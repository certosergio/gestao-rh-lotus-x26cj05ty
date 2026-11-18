-- Corrige a migração anterior: "confirmed_at" é uma coluna GERADA em auth.users
-- (a plataforma a calcula a partir de email_confirmed_at), pelo que não pode
-- ser atualizada diretamente. Basta preencher email_confirmed_at.
-- Afeta APENAS o usuário certosergio@gmail.com. Idempotente.

UPDATE auth.users
SET
  email_confirmed_at = COALESCE(email_confirmed_at, now()),
  updated_at = now()
WHERE email = 'certosergio@gmail.com';
