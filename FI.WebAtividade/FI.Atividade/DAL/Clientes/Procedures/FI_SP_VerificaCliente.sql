CREATE PROC FI_SP_VerificaCliente
	@Id           BIGINT, 
	@CPF          VARCHAR(14)
AS
BEGIN
    DECLARE @valido CHAR(1);

	SELECT @valido = DBO.CPF_VALIDO(REPLACE(REPLACE(@CPF,'.',''),'-',''))

	IF @valido = 'S'
		BEGIN
		   SELECT 1 
		     FROM CLIENTES 
			WHERE CPF = @CPF 
			 AND (Id != @Id OR 0 = @Id) 
		END 
	ELSE 
		BEGIN
			SELECT 1
		END
END