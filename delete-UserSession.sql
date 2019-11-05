SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Ignacio Pinedo
-- Create Date: 2019/10/25
-- Description: Procedure creation
-- =============================================
ALTER PROCEDURE deleteUserSessions
AS
BEGIN
    SET NOCOUNT ON
	DELETE FROM tb_UserSession
	WHERE [ExpireDate] < GETDATE()
END
GO
