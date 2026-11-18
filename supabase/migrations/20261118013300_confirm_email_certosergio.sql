-- Confirma manualmente o e-mail do usuário certosergio@gmail.com
-- (cadastro nunca confirmado -> login falhava). Afeta APENAS este usuário.
-- Idempotente: preenche as colunas de confirmação se ainda estiverem nulas.
-- NOTA: "confirmed_at" é uma coluna GERADA em auth.users (derivada de
-- email_confirmed_at) e não pode ser atualizada diretamente.

UPDATE auth.users
SET
  email_confirmed_at = COALESCE(email_confirmed_at, now()),
  updated_at = now()
WHERE email = 'certosergio@gmail.com';
