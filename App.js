import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  Button,
  TextInput
} from 'react-native';

import {
  Header,
  Colors,
} from 'react-native/Libraries/NewAppScreen';

import Crashes from 'appcenter-crashes';
import Analytics from 'appcenter-analytics';

class App extends React.Component {
  state = {
    text: '6'
  }

  throwError = () => {
    Crashes.generateTestCrash();
  }

  trackEvent = () => {
    Analytics.trackEvent('Test Event Tracked');
  }

  onChangeText = (text) => {
    this.setState({ text })
  }

  render() {
    return (
      <>
        <StatusBar barStyle="dark-content" />
        <SafeAreaView>
          <ScrollView
            contentInsetAdjustmentBehavior="automatic"
            style={styles.scrollView}>
            <Header />
            <View style={styles.body}>
              <View style={styles.sectionContainer} accessibilityLabel='test_1'>
                <Text style={styles.sectionTitle}>Hello World</Text>
                <Text style={styles.sectionDescription}>
                  This is an example app for Azure App Service.
                  It works in Android and iOS!
                </Text>
                <Button style={{ marginTop: '5px'}} title='Crash' onPress={this.throwError} />
                <Button style={{ marginTop: '5px'}} title='Track Event' onPress={this.trackEvent} />
                <TextInput
                  style={{ height: 40, width: 100, borderColor: 'gray', borderWidth: 1 }}
                  onChangeText={this.onChangeText}
                  value={this.state.text}
                />
                <View style={{ margin: 20 }}> 
                  <Text>:)</Text>
                </View>
              </View>
            </View>
          </ScrollView>
        </SafeAreaView>
      </>
    );
  }
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  }
});

export default App;
