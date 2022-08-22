# Authors: @sp773
# ----------------------------------------------------------------------------
# Imports
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import finnhub
import datetime
import pandas as pd

delta = datetime.timedelta(days=7)

def get_news_train(stock, start, end):
    # Connect to API
    finnhub_client = finnhub.Client(api_key="c7u5odaad3ifisk2ik60")
    headlines = pd.DataFrame(columns=['datetime', 'headline'])

    # Loop to fetch news headlines
    while start <= end:
        final = start + delta
        list_headlines = finnhub_client.company_news(stock, _from=start, to=end)
        temp_headlines = pd.DataFrame(list_headlines, columns=['datetime', 'headline'])
        headlines = headlines.append(temp_headlines, ignore_index=True)
        start += delta

    # Data clean-up
    headlines['datetime'] = pd.to_datetime(headlines['datetime'], unit='s').dt.date
    headlines.sort_values(by='datetime', inplace=True, ascending=True)
    headlines = headlines.drop_duplicates('datetime', keep='last')
    headlines = headlines.reset_index(drop=True)
    headlines = headlines.reset_index(level=0)

    # Save as excel spreadsheet
    path = r"Headlines\\"
    headlines.to_excel(f"{path}{stock}-train-&-test-headlines.xlsx", index=False)

    return headlines

def get_news_rec(stock, start, present):
    # Connect to API
    finnhub_client = finnhub.Client(api_key="c7u5odaad3ifisk2ik60")
    headlines = pd.DataFrame(columns=['datetime', 'headline'])

    # Loop to fetch news headlines
    while start <= present:
        end = start + delta
        list_headlines = finnhub_client.company_news(stock, _from=start, to=end)
        temp_headlines = pd.DataFrame(list_headlines, columns=['datetime', 'headline'])
        headlines = headlines.append(temp_headlines, ignore_index=True)
        start += delta

    # Data clean-up
    headlines['datetime'] = pd.to_datetime(headlines['datetime'], unit='s').dt.date
    headlines.sort_values(by='datetime', inplace=True, ascending=True)
    headlines = headlines.drop_duplicates('datetime', keep='last')
    headlines = headlines.reset_index(drop=True)
    headlines.columns = ['date', 'headline']
    headlines['date'] = pd.to_datetime(headlines['date'])

    return headlines

def sentiment_analysis(headlines):
    '''
    :param headlines: news headlines
    :return: Dataframe of float values including sentiment score compound and date of news headline
    -------------------------
    | compound |    date    |
    ------------------------
    |   0.59  | 2022-03-09 |
    -----------------------
    compound: normalised sum of positive, negative, and neutral scores in a range from -1 to 1
    '''
    SIA = SentimentIntensityAnalyzer()

    # Adding frequently used words to lexicon to improve efficiency
    new_words = {'gains': 2.5, 'buy': 3.0, 'thrive': 2.5, 'top': 2.5, 'highlights': 2.0, 'missing out': 1.5,
                 'miss': -1.0, 'misses': -2.0, 'sink': -1.0, 'sinked': -2.0, 'sec': -1.5,
                 'high': 2.0, 'low': -1.5, 'rise': 2.0, 'rose': 1.5, 'beat': 1.5, 'beats': 1.5,
                 'jump': 2.5, 'jumps': 2.5, 'jumping': 2.0, 'jumped': 2.0,
                 'surge': 3.0, 'surges': 3.0, 'surging': 3.0, 'surged': 2.0}
    SIA.lexicon.update(new_words)

    # Implementing Sentiment Analyser, adding scores to the df, storing all data in a dictionary
    polarity_scores = headlines['headline'].apply(SIA.polarity_scores).tolist()

    # Add scores to dataframe
    scores = pd.DataFrame(polarity_scores)
    news = headlines.join(scores)

    # Join date
    extracted_date = news['date']
    scores = scores.join(extracted_date)

    # Data transformations
    sentiment_set = scores[['compound', 'date']]

    return sentiment_set