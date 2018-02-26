# reliability-monitoring
Scenario for Supplier Quality Analysis by Power BI

The COO of a tech manufacturing company noticed that there is a spike in downtime when he reviewed the quarterly production reliabiliy figures.  Investigate the daily logs of supply defects.  Use the ff guide questions:

* Which plants contributed to the sharp increase in downtime?
* How recent did the problems occur?
* Which inputs and stages of the production process were most affected?
* Which materials and from which vendors contributed most to the defects/downtime?

## Data sources

### Raw
Raw data files.

| Data File/Directory | Description | Location | Columns | Rows | Size |
|:--|:--|:--|--:|--:|--:|
| **Companywide downtime logs** | Collated plant downtime logs and plant addresses | [`data02_metrics with plant address.xlsx`](https://drive.google.com/open?id=1hj9Fm-EVFxlXKywlE3qcBSMUflJQnfc-) |  |  | 232,002 bytes |
| Collated downtime logs | Collated plant downtime logs | [`[data02_metrics with plant address.xlsx]Metrics!`](https://drive.google.com/open?id=1hj9Fm-EVFxlXKywlE3qcBSMUflJQnfc-) | 9 columns | 6,145 rows |  |
| Plant addresses | City and state of plants | [`[data02_metrics with plant address.xlsx]Plant Addresses!`](https://drive.google.com/open?id=1hj9Fm-EVFxlXKywlE3qcBSMUflJQnfc-) | 3 columns | 24 rows |  |

### Loaded
Parsed data files.

| Dataset | Data File | Description | Columns | Rows | Input Data | Data Processing Scripts |
|:--|:--|:--|--:|--:|:--|:--|
|  |  |  |  |  |  |  |

## Work Products

#### Data

| Data File | Description | Columns | Rows | Input Data | Data Processing Scripts | csv Data File | xlsx Data File | R Data File |
|:--|:--|--:|--:|:--|:--|:--|:--|:--|
|  |  |  |  |  |  |  |  |  |

#### Plots

| Plot | File | Script | Input data |
|:--|:--|:--|:--|
|  |  |  |  |

#### Dashboards

| Dashboard | Platform | Location | Input data |
|:--|:-:|:--|:--|
| Reliability Monitoring | Tableau | [`Tableau dashboard`](https://public.tableau.com/profile/robin.ramos#!/vizhome/Reliabilitymonitoring/Dashboard1?publish=yes) | data02_metrics with plant address.xlsx |

#### Models

#### Reports
