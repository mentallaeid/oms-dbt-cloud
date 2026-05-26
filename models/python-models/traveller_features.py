from datetime import datetime
from dateutil import parse
from sklearn.preprocessing import LabelEncoder

def model(dbt, session):

    dbt.config(
        materialized = "table"
        packages = ["scikit-learn"]
    )

    # Load travellers table into a dataframe
    df = dbt.source("landing", "TRAVELLERS").to_pandas()

    #Parse dates with several formats using dateutil and calculate age from DOB
    def calculate_age(dob_string):
        dob = parser.parse(dob_string)
        age = datetime.today().year - dob.year

        return age

    df['AGE'] = df['DOB'].apply(calculate_age)

    # Encode categorical columns to numeric
    df['GENDER_ENCODED'] = LabelEncoder.fit_transform(df['GENDER'].astype(str))
    df['CITY_ENCODED'] = LabelEncoder.fit_transform(df['CITY'].astype(str))

    # select final columns for output
    df_results = df[['TRAVELLER_ID', 'AGE', 'GENDER_ENCODED', 'CITY_ENCODED']]

    return session.create_dataframe(df_results)

