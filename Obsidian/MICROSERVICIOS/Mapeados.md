# 📌 Microservicios

## 👤 Pablo

### ✅ Implementados

| Estado | Proceso                   | Microservicio                                            | Ruta Praxis | Comentario                                                |
| ------ | ------------------------- | -------------------------------------------------------- | ----------- | --------------------------------------------------------- |
| ✅      | Accounting Master Process | `/sales-commissions/accounting-master-process-consortia` | —           | —                                                         |
| ✅      | Commissions GSA           | `/sales-masterdata/commissions-gsa`                      | —           | —                                                         |
| ✅      | Commissions FOB           | `/sales-masterdata/commissions-fob`                      | —           | —                                                         |
| ✅      | Processing Commissions    | `/sales-masterdata/processing-commissions`               | —           | No existe el programa en Producción (se migró la lógica). |
| ✅      | Consortium Commissions    | `/sales-masterdata/consortium-commissions`               | —           | No existe el programa en Producción (se migró la lógica). |
| ✅      | Invoice Commission FOB    | `/sales-commissions/invoice-commission-fob-fobs`         | —           | —                                                         |
| ✅      | Load ATPCO                | `/salesaudit-core/load-atpco-atpco`                      | —           | —                                                         |
| ✅      | Load Master Sales         | `/salesaudit-core/load-master-sales-sales`               | —           | —                                                         |
| ✅      | Fares ATPCO               | `/salesaudit-core/fares-atpco-atpco`                     | —           | —                                                         |
| ✅      | Fare Class ATPCO          | `/salesaudit-core/fare-class-atpco-atpco`                | —           | —                                                         |
| ✅      | Rules ATPCO               | `/salesaudit-core/rules-atpco-atpco`                     | —           | —                                                         |
| ⏳      | Taxes by Code             | `/salesaudit-core/taxes-by-code-ttbs`                    | —           | Pendiente.                                                |
| ⏳      | Taxes by Segment          | `/salesaudit-core/taxes-by-segment-ttbs`                 | —           | Pendiente.                                                |

---

## 🚧 Backlog

| Estado | Proceso                         | Microservicio                                              | Ruta Praxis                                               | Comentario |
| ------ | ------------------------------- | ---------------------------------------------------------- | --------------------------------------------------------- | ---------- |
| 🚧     | Payment Notification Report     | `/sales-commissions/payment-notification-report-fobs`      | `sales/commissions/fob's/Payment Notification Report`     | Backlog    |
| 🚧     | Accounting Master Process       | `/sales-commissions/accounting-master-process-fobs`        | `sales/commissions/fob's/Accounting Master Process`       | Backlog    |
| 🚧     | GSA Record                      | `/sales-commissions/gsa-record-gsa`                        | `sales/commissions/gsa/GSA Record`                        | Backlog    |
| 🚧     | Invoice Commission GSA          | `/sales-commissions/invoice-commission-gsa-gsa`            | `sales/commissions/gsa/Invoice Commission GSA`            | Backlog    |
| 🚧     | Interline GSA Commission Report | `/sales-commissions/interline-gsa-commision-report-gsa`    | `sales/commissions/gsa/Interline GSA Commission Report`   | Backlog    |
| 🚧     | Condition IATA Exclude          | `/sales-commissions/condition-iata-exclude-gsa-commission` | `sales/commissions/gsa/Commission/Condition IATA Exclude` | Backlog    |
| 🚧     | Conditions (Commission)         | `/sales-commissions/conditions-gsa-commission`             | `sales/commissions/gsa/Commission/Conditions`             | Backlog    |
| 🚧     | Commission BSP & ASR            | `/sales-commissions/commission-bsp-&-asr-gsa-commission`   | `sales/commissions/gsa/Commission/Commission BSP & ASR`   | Backlog    |
| 🚧     | Country Objective               | `/sales-commissions/country-objective-gsa-incentive`       | `sales/commissions/gsa/Incentive/Country Objective`       | Backlog    |
| 🚧     | Conditions (Incentive)          | `/sales-commissions/country-objective-gsa-incentive`       | `sales/commissions/gsa/Incentive/Conditions`              | Backlog    |
| 🚧     | Summary                         | `/sales-commissions/summary-gsa-incentive`                 | `sales/commissions/gsa/Incentive/Summary`                 | Backlog    |
| 🚧     | Calculation                     | `/sales-commissions/calculation-gsa-incentive`             | `sales/commissions/gsa/Incentive/Calculation`             | Backlog    |
| 🚧     | Incentive                       | `/sales-commissions/incentive-gsa-incentive`               | `sales/commissions/gsa/Incentive/Incentive`               | Backlog    |

---

# 👤 Yadira

| Estado | Proceso                          | Microservicio                                                   | Ruta Praxis | Comentario |
| ------ | -------------------------------- | --------------------------------------------------------------- | ----------- | ---------- |
| ok     | Accounting Master FG             | `/sales-masterdata/accounting-master-fg-accounting`             | —           | Pendiente  |
| ok     | Accounting Master Sales          | `/sales-masterdata/accounting-master-sales-accounting`          | —           | Pendiente  |
| ok     | Accounting Master Tax            | `/sales-masterdata/accounting-master-tax-accounting`            | —           | Pendiente  |
| ok     | Accounting Master Client         | `/sales-masterdata/accounting-master-client-accounting`         | —           | Pendiente  |
| ok     | Accounting Supplier              | `/sales-masterdata/accounting-supplier-accounting`              | —           | Pendiente  |
| ok     | Accounting Master CCAM           | `/sales-masterdata/accounting-master-ccam-accounting`           | —           | Pendiente  |
| ok     | Accounting Master UATP           | `/sales-masterdata/accounting-master-uatp-accounting`           | —           | Pendiente  |
| ok     | Accounting Master Paga Todo      | `/sales-masterdata/accounting-master-paga-todo-accounting`      | —           | Pendiente  |
| ok     | Accounting Master Travel Voucher | `/sales-masterdata/accounting-master-travel-voucher-accounting` | —           | Pendiente  |

> [!info] Leyenda
> 
> - ✅ Implementado
>     
> - ⏳ Pendiente
>     
> - 🚧 Backlog
>     
> - ❌ No implementado
>     
> - ⚠️ Observaciones importantes en la columna **Comentario**.
>