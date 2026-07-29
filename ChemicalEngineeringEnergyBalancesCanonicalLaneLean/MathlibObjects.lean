import chemicalEngineeringEnergyBalancesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EnergyBalanceSystem where
  carrier : Type
  phaseSpace : TopologicalSpace carrier

structure EnergyBalanceAdmittedObject where
  system : EnergyBalanceSystem
  closedSystem : Prop
  energyConserved : Prop
  steadyState : Type
  steadyTopology : TopologicalSpace steadyState
  equilibriumReached : Prop
  conclusion : equilibriumReached

structure EnergyBalanceEndgameState where
  object : EnergyBalanceAdmittedObject

def EnergyBalanceWitnessClosed (O : EnergyBalanceAdmittedObject) : Prop :=
  O.equilibriumReached

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse