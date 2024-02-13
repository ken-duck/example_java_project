package io.github.amykeibler.dependency;

import java.util.Locale;

/**
 * Example documentation
 */
public class ExampleParent
{
  /**
   * Example function
   * @param input The text to be modified
   * @return The modified text
   */
  public String example(String input) {
    return input.toLowerCase(Locale.getDefault());
  }

  public boolean isExample(String input) {
    return true;
  }
}
