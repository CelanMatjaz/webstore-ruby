## DROPDOWN PARTIAL
To render items, provide an array of groups when calling render method

### Group object layout:
```
{
    :title // Optional string of the group's title, title is not rendered if it's nil
    :items // Array of items to render, item object layout shown below
}
```

### Item object layout:
```
{
    :label  // String of the label to show 
    :type   // One of ('link', 'label', 'button_to') which specify what to render
    :path   // Path to which a 'link_to' or 'button_to' will link to (ignored if :type is not 'link_to' or 'button_to')
    :method // Method to be used in the 'button_to', ignored if :type is not 'button_to'
}
```


### Basic example of function call without erb tags
```
render 'layouts/dropdown', groups: [{
    title: 'Group 1',
    items: [
        { label: 'Text 1', type: 'link', path: root_path },
        { label: 'Text 2', type: 'button_to', path: root_path },
        { label: 'Text 3', type: 'label' },
    ],
}] 
```

### Example with multiple groups without titles
```
render 'layouts/dropdown', groups: [
    { items: [{ label: 'Text-group 1', type: 'link', path: root_path }] },
    { items: [{ label: 'Text-group 2', type: 'link', path: root_path }] },
    { items: [{ label: 'Text-group 3', type: 'link', path: root_path }] },
] 
```
