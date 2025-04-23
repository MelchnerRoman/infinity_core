Users 			= {}
PlayerDatas 	= {}

----
-- [[ Load Session ]]
----
function LoadPlayer(source, charid, Session)
	if source ~= nil then 
		local _source  		= source
		local infinityPlayer 	= CreatePlayerinfinity(
			_source, 
			charid, 
			Session.rank, 
			Session.lastname,
			Session.firstname, 
			Session.years, 
			Session.nationality, 
			Session.sex, 
			Session.bank, 
			Session.cash, 
			Session.xp, 
			Session.golds, 
			Session.job, 
			Session.jobgrade, 
			Session.gang, 
			Session.gangrank, 
			Session.inventory
		)
		Users[_source] 		= infinityPlayer
		TriggerEvent('infinitycore:playerLoaded', _source, Users[_source])
		TriggerClientEvent('infinitycore:playerLoaded', 
			_source, 
			Users[_source].getCharID(), 
			Users[_source].getRank(), 
			Users[_source].getLastname(), 
			Users[_source].getFirstname(),
			Users[_source].getYears(),
			Users[_source].getNation(),
			Users[_source].getSex(),
			Users[_source].getBank(),
			Users[_source].getCash(),
			Users[_source].getXp(),
			Users[_source].getGold(),
			Users[_source].getJob(),
			Users[_source].getJobGrade(),
			Users[_source].getGang(),
			Users[_source].getGangRank(),
			Users[_source].getInventory()
		)
	end
end

----
-- [[ Make Session ]]
----
function CreatePlayerinfinity(source, charid, rank, lastname, firstname, years, nation, sex, bank, cash, xp, gold, job, jobgrade, gang, gangrank, inventory)
	
	local self   	= {}
	self.source  	= source
	self.charid     = charid
	self.rank    	= rank
	self.lastname 	= lastname
	self.firstname 	= firstname
	self.years 		= years
	self.nation 	= nation
	self.sex 		= sex
	self.bank 		= bank
	self.cash 		= cash
	self.xp 		= xp
	self.gold 		= gold
	self.job 		= job
	self.jobgrade 	= jobgrade
	self.gang 		= gang
	self.gangrank 	= gangrank
	self.inventory 	= inventory

	local infinityTable = {}

	infinityTable.getCharID = function()
		return self.charid
	end

	infinityTable.getRank = function()
		return self.rank
	end

	infinityTable.getLastname = function()
		return self.lastname
	end

	infinityTable.getFirstname = function()
		return self.firstname
	end

	infinityTable.getYears = function()
		return self.years
	end

	infinityTable.getNation = function()
		return self.nation
	end

	infinityTable.getSex = function()
		return self.sex
	end

	infinityTable.getBank = function()
		return self.bank
	end

	infinityTable.getCash = function()
		return self.cash
	end

	infinityTable.getXp = function()
		return self.xp
	end

	infinityTable.getGold = function()
		return self.gold
	end

	infinityTable.getJob = function()
		return self.job
	end

	infinityTable.getJobGrade = function()
		return self.jobgrade
	end

	infinityTable.getGang = function()
		return self.gang
	end

	infinityTable.getGangRank = function()
		return self.gangrank
	end

	infinityTable.getInventory = function()
		return self.inventory
	end

    return infinityTable
end

----
-- [[ Refresh Session ]]
----
RegisterNetEvent('infinity_core:refreshServerSession')
AddEventHandler('infinity_core:refreshServerSession', function(ReceiveDatas)
	local _target  		= ReceiveDatas._InfinitySource
	local infinityPlayer 	= CreatePlayerinfinity(
		ReceiveDatas._InfinitySource, 
		ReceiveDatas._Charid, 
		ReceiveDatas._Rank, 
		ReceiveDatas._Lastname, 
		ReceiveDatas._Firstname, 
		ReceiveDatas._Years, 
		ReceiveDatas._Nation, 
		ReceiveDatas._Sex, 
		ReceiveDatas._Bank, 
		ReceiveDatas._Cash, 
		ReceiveDatas._Xp, 
		ReceiveDatas._Gold,
		ReceiveDatas._Job,
		ReceiveDatas._JobGrade,
		ReceiveDatas._Gang,
		ReceiveDatas._GangRank,
		ReceiveDatas._Inventory
	)
	Users[_target] 		= infinityPlayer
end)

----
-- [[ Get Session Of Source ID ]]
----
function GetPlayerSession(id)
	Source  		= tonumber(id)
    local PlayerDatas 	= {
        _InfinitySource = Source,
		_Charid       = Users[Source].getCharID(),
        _Rank         = Users[Source].getRank(),
        _Lastname     = Users[Source].getLastname(),
        _Firstname    = Users[Source].getFirstname(), 
        _Years        = Users[Source].getYears(),
        _Nation       = Users[Source].getNation(),
		_Sex       	  = Users[Source].getSex(),
		_Bank 	      = Users[Source].getBank(),
		_Cash 	      = Users[Source].getCash(),
		_Xp 	      = Users[Source].getXp(),
		_Gold 	      = Users[Source].getGold(),
		_Job 	      = Users[Source].getJob(),
		_JobGrade 	  = Users[Source].getJobGrade(),
		_Gang	      = Users[Source].getGang(),
		_GangRank 	  = Users[Source].getGangRank(),
		_Inventory 	  = Users[Source].getInventory()
    }
    return PlayerDatas
end

----
-- [[ Get Session Of Target ID ]]
----
function GetPlayerTargetSession(id)
	Target  			= tonumber(id)
    local PlayerDatasT 	= {
        _InfinitySourceT 	= Target,
		_CharidT        = Users[Target].getCharID(),
        _RankT         	= Users[Target].getRank(),
        _LastnameT    	= Users[Target].getLastname(),
        _FirstnameT    	= Users[Target].getFirstname(), 
        _YearsT        	= Users[Target].getYears(),
        _NationT       	= Users[Target].getNation(),
		_SexT       	= Users[Target].getSex(),
		_BankT 	      	= Users[Target].getBank(),
		_CashT 	      	= Users[Target].getCash(),
		_XpT 	      	= Users[Target].getXp(),
		_GoldT 	      	= Users[Target].getGold(),
		_JobT 	      	= Users[Target].getJob(),
		_JobGradeT 	  	= Users[Target].getJobGrade(),
		_GangT	      	= Users[Target].getGang(),
		_GangRankT 	  	= Users[Target].getGangRank(),
		_InventoryT 	= Users[Target].getInventory()
    }
    return PlayerDatasT
end

----
-- [[ Save Player Every X Milliseconds in SQL ]]
----
RegisterNetEvent("SavePlayerDatas")
AddEventHandler("SavePlayerDatas", 
function(SaveDatas)
	--print(json.encode(SaveDatas, { indent = true, sort_keys = true }))
	if SaveDatas._InfinitySource ~= nil and SaveDatas._Cash ~= nil then 
		local SourceSteamID = GetPlayerSource( SaveDatas._InfinitySource)
		if SourceSteamID ~= nil and SaveDatas._Inventory ~= nil and SaveDatas._Charid ~= nil and SaveDatas.HPClass ~= nil then 
			local _lastPosition = {
				x = SaveDatas.p_coords_x,
				y = SaveDatas.p_coords_y,
				z = SaveDatas.p_coords_z,
				h = SaveDatas.p_coords_h
			}
			local dateLisible = os.date("%Y-%m-%d %H:%M:%S", os.time())
			print('^7PlayerID ^6'.. SaveDatas._InfinitySource ..' ^7are saved in db from ^6'..dateLisible)
			exports.oxmysql:prepare('UPDATE players SET bank = ?, cash = ?, xp = ?, golds = ?, hp = ?, drink = ?, food = ?, coords = ?, job = ?, jobgrade = ?, gang = ?, gangrank = ?, inventory = ?, last_online = ? WHERE steam_identifier = ? AND charid = ?',{
				SaveDatas._Bank, 
				SaveDatas._Cash, 
				SaveDatas._Xp,
				SaveDatas._Gold,
				SaveDatas.HPClass, 
				SaveDatas.WaterClass, 
				SaveDatas.EatClass,
				json.encode(_lastPosition),
				SaveDatas._Job,
				SaveDatas._JobGrade,
				SaveDatas._Gang, 
				SaveDatas._GangRank,
				SaveDatas._Inventory,
				dateLisible,
				SourceSteamID,
				SaveDatas._Charid
			})
		end
	end
end)
