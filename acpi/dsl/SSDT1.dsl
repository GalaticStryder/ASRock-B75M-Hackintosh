/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20141107-64 [Jan  2 2015]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT1.aml, Fri Jan 29 10:47:21 2016
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000007E1 (2017)
 *     Revision         0x01
 *     Checksum         0x00
 *     OEM ID           "Intel_"
 *     OEM Table ID     "AoacTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20091112 (537465106)
 */
DefinitionBlock ("SSDT1.aml", "SSDT", 1, "Intel_", "AoacTabl", 0x00001000)
{

    /*
     * External declarations that were imported from
     * the reference file [refs.txt]
     */
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // 2 Arguments

    External (_SB_.IFFS.FFSS, UnknownObj)
    External (_SB_.PCI0.LPCB.H_EC.ABT0, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.ABT1, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.AWTE, UnknownObj)
    External (_SB_.PCI0.LPCB.H_EC.AWTL, UnknownObj)
    External (_SB_.PCI0.LPCB.H_EC.AWTM, UnknownObj)
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // 1 Arguments
    External (AOAC, FieldUnitObj)
    External (ECTM, FieldUnitObj)
    External (FDTP, IntObj)
    External (OSYS, FieldUnitObj)
    External (PFLV, FieldUnitObj)
    External (SLDR, FieldUnitObj)

    Scope (\_SB)
    {
        Device (IAOE)
        {
            Name (_HID, "INT33A0")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (ABT0, Zero)
            Name (ABT1, Zero)
            Name (ANSB, Zero)
            Name (AWTM, Zero)
            Name (AWTE, Zero)
            Name (AWTL, Zero)
            Name (AWDT, 0x2D)
            Name (PTSL, Zero)
            Name (SLPD, Zero)
            OperationRegion (CMS1, SystemIO, 0x72, 0x02)
            Field (CMS1, ByteAcc, NoLock, Preserve)
            {
                IDX0,   7, 
                Offset (0x01), 
                DAT0,   8
            }

            IndexField (IDX0, DAT0, ByteAcc, NoLock, Preserve)
            {
                Offset (0x02), 
                WAKR,   8
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LGreaterEqual (OSYS, 0x07D9))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (GABS, 0, NotSerialized)
            {
                Return (AOAC)
            }

            Method (GAOS, 0, NotSerialized)
            {
                If (LEqual (PFLV, FDTP))
                {
                    Return (ABT0)
                }
                Else
                {
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT0, Local0)
                    }
                    Else
                    {
                        Store (ABT0, Local0)
                    }

                    Return (And (Local0, One))
                }
            }

            Method (SAOS, 1, NotSerialized)
            {
                If (LEqual (PFLV, FDTP))
                {
                    Store (Arg0, ABT0)
                }
                Else
                {
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT0, Local0)
                    }
                    Else
                    {
                        Store (ABT0, Local0)
                    }

                    And (Local0, 0xFE, Local0)
                    Or (Local0, And (Arg0, One), Local0)
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (Local0, \_SB.PCI0.LPCB.H_EC.ABT0)
                        \_SB.PCI0.LPCB.H_EC.ECMD (0x2A)
                    }
                    Else
                    {
                        Store (Local0, ABT0)
                    }
                }
            }

            Method (GANS, 0, NotSerialized)
            {
                Return (ANSB)
            }

            Method (SANS, 1, NotSerialized)
            {
                Store (And (Arg0, One), ANSB)
            }

            Method (GWLS, 0, NotSerialized)
            {
                If (LEqual (PFLV, FDTP))
                {
                    Return (ABT0)
                }
                Else
                {
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT1))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT1, Local0)
                    }
                    Else
                    {
                        Store (ABT1, Local0)
                    }

                    Or (Local0, One, Local0)
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT0, Local1)
                    }
                    Else
                    {
                        Store (ABT0, Local1)
                    }

                    Or (Local0, And (Local1, 0x02), Local0)
                    Or (Local0, And (Local1, 0x04), Local0)
                    Or (Local0, And (Local1, 0x08), Local0)
                    Return (Local0)
                }
            }

            Method (SWLS, 1, NotSerialized)
            {
                If (LEqual (PFLV, FDTP))
                {
                    Store (Arg0, ABT0)
                }
                Else
                {
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT1))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT1, Local0)
                    }
                    Else
                    {
                        Store (ABT1, Local0)
                    }

                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT1))
                    {
                        Store (Local0, \_SB.PCI0.LPCB.H_EC.ABT1)
                        \_SB.PCI0.LPCB.H_EC.ECMD (0x2A)
                    }
                    Else
                    {
                        Store (Local0, ABT1)
                    }

                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT0, Local0)
                    }
                    Else
                    {
                        Store (ABT0, Local0)
                    }

                    And (Local0, 0xF1, Local0)
                    Or (Local0, And (Arg0, 0x02), Local0)
                    If (CondRefOf (\_SB.IFFS.FFSS))
                    {
                        If (LAnd (And (\_SB.IFFS.FFSS, 0x03), And (Arg0, 0x02)))
                        {
                            Or (Local0, 0x04, Local0)
                        }
                        Else
                        {
                            Or (Local0, And (Arg0, 0x04), Local0)
                        }
                    }
                    Else
                    {
                        Or (Local0, And (Arg0, 0x04), Local0)
                    }

                    Or (Local0, And (Arg0, 0x08), Local0)
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (Local0, \_SB.PCI0.LPCB.H_EC.ABT0)
                        \_SB.PCI0.LPCB.H_EC.ECMD (0x2A)
                    }
                    Else
                    {
                        Store (Local0, ABT0)
                    }
                }
            }

            Method (GWWS, 0, NotSerialized)
            {
                If (LEqual (PFLV, FDTP))
                {
                    Return (ABT0)
                }
                Else
                {
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT1))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT1, Local0)
                    }
                    Else
                    {
                        Store (ABT1, Local0)
                    }

                    ShiftRight (Or (Local0, 0x02), One, Local0)
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT0, Local1)
                    }
                    Else
                    {
                        Store (ABT0, Local1)
                    }

                    Or (Local0, ShiftRight (And (Local1, 0x10), 0x03), Local0)
                    Or (Local0, ShiftRight (And (Local1, 0x20), 0x03), Local0)
                    Or (Local0, ShiftRight (And (Local1, 0x40), 0x03), Local0)
                    Return (Local0)
                }
            }

            Method (SWWS, 1, NotSerialized)
            {
                If (LEqual (PFLV, FDTP))
                {
                    Store (Arg0, ABT0)
                }
                Else
                {
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT1))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT1, Local0)
                    }
                    Else
                    {
                        Store (ABT1, Local0)
                    }

                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT1))
                    {
                        Store (Local0, \_SB.PCI0.LPCB.H_EC.ABT1)
                        \_SB.PCI0.LPCB.H_EC.ECMD (0x2A)
                    }
                    Else
                    {
                        Store (Local0, ABT1)
                    }

                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (\_SB.PCI0.LPCB.H_EC.ABT0, Local0)
                    }
                    Else
                    {
                        Store (ABT0, Local0)
                    }

                    And (Local0, 0x8F, Local0)
                    Or (Local0, ShiftLeft (And (Arg0, 0x02), 0x03), Local0)
                    If (CondRefOf (\_SB.IFFS.FFSS))
                    {
                        If (LAnd (And (\_SB.IFFS.FFSS, 0x03), And (Arg0, 0x02)))
                        {
                            Or (Local0, 0x20, Local0)
                        }
                        Else
                        {
                            Or (Local0, ShiftLeft (And (Arg0, 0x04), 0x03), Local0)
                        }
                    }
                    Else
                    {
                        Or (Local0, ShiftLeft (And (Arg0, 0x04), 0x03), Local0)
                    }

                    Or (Local0, ShiftLeft (And (Arg0, 0x08), 0x03), Local0)
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ABT0))
                    {
                        Store (Local0, \_SB.PCI0.LPCB.H_EC.ABT0)
                        \_SB.PCI0.LPCB.H_EC.ECMD (0x2A)
                    }
                    Else
                    {
                        Store (Local0, ABT0)
                    }
                }
            }

            Method (SASD, 1, NotSerialized)
            {
                If (LAnd (And (AOAC, 0x10), LGreater (Arg0, Zero)))
                {
                    If (LEqual (PFLV, FDTP))
                    {
                        Store (Arg0, SLDR)
                    }
                    Else
                    {
                        Store (Arg0, ECTM)
                    }

                    If (LAnd (CondRefOf (\_SB.PCI0.LPCB.H_EC.AWTL), LEqual (PTSL, 0x03)))
                    {
                        Store (And (ShiftRight (ECTM, Zero), 0xFF), \_SB.PCI0.LPCB.H_EC.AWTL)
                        Store (And (ShiftRight (ECTM, 0x08), 0x7F), \_SB.PCI0.LPCB.H_EC.AWTM)
                        Store (One, \_SB.PCI0.LPCB.H_EC.AWTE)
                    }
                    Else
                    {
                        Store (And (ShiftRight (ECTM, Zero), 0xFF), AWTL)
                        Store (And (ShiftRight (ECTM, 0x08), 0x7F), AWTM)
                        Store (One, AWTE)
                    }
                }
                Else
                {
                    Store (Arg0, SLPD)
                }
            }

            Method (GPWR, 0, NotSerialized)
            {
                Return (And (WAKR, 0x0F))
            }

            Method (GAWD, 0, NotSerialized)
            {
                Return (AWDT)
            }

            Method (SAWD, 1, NotSerialized)
            {
                Store (Arg0, AWDT)
            }
        }
    }
}

