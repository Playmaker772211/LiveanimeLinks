--Shield and Sword (DOR)
--scripted by GameMaster(GM)
function c511005727.initial_effect(c)
--Activate
local e1=Effect.CreateEffect(c)
e1:SetCategory(CATEGORY_ATKCHANGE+CATEGORY_DEFCHANGE)
e1:SetType(EFFECT_TYPE_ACTIVATE)
e1:SetCode(EVENT_FREE_CHAIN)
e1:SetTarget(c511005727.target)
e1:SetOperation(c511005727.activate)
c:RegisterEffect(e1)
end

function c511005727.target(e,tp,eg,ep,ev,re,r,rp,chk)
if chk==0 then return e:IsHasType(EFFECT_TYPE_ACTIVATE)
and Duel.IsExistingMatchingCard(Card.IsFaceup,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil) end
local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
Duel.SetTargetCard(g)
end

function c511005727.filter(c,e)
return c:IsFaceup() and c:IsRelateToEffect(e) and not c:IsImmuneToEffect(e)
end

function c511005727.activate(e,tp,eg,ep,ev,re,r,rp)
local sg=Duel.GetMatchingGroup(c511005727.filter,tp,LOCATION_MZONE,LOCATION_MZONE,nil,e)
local c=e:GetHandler()
local tc=sg:GetFirst()
while tc do
local e1=Effect.CreateEffect(c)
e1:SetType(EFFECT_TYPE_SINGLE)
e1:SetCode(EFFECT_SWAP_BASE_AD)
tc:RegisterEffect(e1)
tc=sg:GetNext()
end
end
