SELECT AIP.PROFILE_ID
	,AIP.PROFILE_NAME
	,INTERFACE_FORMAT = IFrmt.TITLE
	,INTF_DIRECTION = IDir.TITLE
	,AIP.QUEUE_NUMBER
	,AIP.PURGE_DAYS
	,INTERFACE_KIND = Iknd.KIND_NAME
	,NET_CTX = ICTX.TITLE
	,BASE_FORMAT = IBFrmt.TITLE
	,PHYSICAL_LINK = IPhyL.TITLE
	,IC_LINK_METHOD = IICLM.TITLE
FROM dbo.INTERFACE_PROFILE AS AIP
LEFT JOIN dbo.INTERFACE_KIND AS Iknd ON AIP.INTERFACE_KIND_ID = Iknd.KIND_ID
LEFT JOIN dbo.ZC_INTF_FORMAT AS IFrmt ON AIP.INTERFACE_FORMAT_C = IFrmt.INTERFACE_FORMAT_C
LEFT JOIN dbo.ZC_INTF_DIRECTION AS IDir ON AIP.INTF_DIRECTION_C = IDir.INTF_DIRECTION_C
LEFT JOIN dbo.ZC_BASE_FORMAT AS IBFrmt ON AIP.BASE_FORMAT_C = IBFrmt.BASE_FORMAT_C
LEFT JOIN dbo.ZC_PHYSICAL_LINK AS IPhyL ON AIP.PHYSICAL_LINK_C = IPhyL.PHYSICAL_LINK_C
LEFT JOIN dbo.ZC_IC_LINK_METHOD AS IICLM ON AIP.IC_LINK_METHOD_C = IICLM.IC_LINK_METHOD_C
LEFT JOIN dbo.ZC_NET_CTX AS ICTX ON AIP.NET_CTX_C = ICTX.NET_CTX_C
ORDER BY INTERFACE_FORMAT
	,Cast(PROFILE_ID AS BIGINT)