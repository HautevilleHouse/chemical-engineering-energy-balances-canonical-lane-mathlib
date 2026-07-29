import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure EnergyBalanceEndgameState where
  object : AdmissibleClass

def energyBalanceProjection : EnergyBalanceEndgameState → EnergyBalanceEndgameState := id

theorem projection_idempotent (x : EnergyBalanceEndgameState) :
    energyBalanceProjection (energyBalanceProjection x) = energyBalanceProjection x := rfl

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse