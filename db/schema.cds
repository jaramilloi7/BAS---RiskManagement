namespace RiskManagement;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    cuid,
    managed
}
from '@sap/cds/common';

entity Risks : cuid, managed
{
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    miti : Association to one Mitigations;
    Supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity Mitigations : cuid, managed
{
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.miti = $self;
}
