--Just Desserts (DOR)
--scripted by GameMaster(GM)
function c511005728.initial_effect(c)
--Activate
local e1=Effect.CreateEffect(c)
e1:SetCategory(CATEGORY_DAMAGE)
e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
e1:SetType(EFFECT_TYPE_ACTIVATE)
e1:SetCode(EVENT_FREE_CHAIN)
e1:SetHintTiming(0,0x1c1)
e1:SetTarget(c511005728.target)
e1:SetOperation(c511005728.activate)
c:RegisterEffect(e1)
end

function c511005728.target(e,tp,eg,ep,ev,re,r,rp,chk)
if chk==0 then return Duel.IsExistingMatchingCard(aux.TRUE,tp,0,LOCATION_MZONE,1,nil) end
Duel.SetTargetPlayer(1-tp)
local dam=Duel.GetFieldGroupCount(1-tp,LOCATION_MZONE,0)*300
Duel.SetTargetParam(dam)
Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,1-tp,dam)
end

function c511005728.activate(e,tp,eg,ep,ev,re,r,rp)
local p=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER)
local dam=Duel.GetFieldGroupCount(1-tp,LOCATION_MZONE,0)*300
Duel.Damage(p,dam,REASON_EFFECT)
end
