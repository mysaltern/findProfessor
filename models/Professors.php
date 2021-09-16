<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "professors".
 *
 * @property int $id
 * @property int|null $sex
 * @property string $name
 * @property string $last_name
 * @property string $email
 * @property string|null $description
 * @property string|null $url
 * @property int|null $university_id
 * @property int|null $department_id
 *
 * @property University $university
 * @property Department $department
 */
class Professors extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'professors';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sex', 'university_id', 'department_id'], 'integer'],
            [['name', 'last_name', 'email'], 'required'],
            [['name', 'last_name', 'email', 'url'], 'string', 'max' => 255],
            [['description'], 'string', 'max' => 20000],
            [['university_id'], 'exist', 'skipOnError' => true, 'targetClass' => University::className(), 'targetAttribute' => ['university_id' => 'id']],
            [['department_id'], 'exist', 'skipOnError' => true, 'targetClass' => Department::className(), 'targetAttribute' => ['department_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sex' => 'Sex',
            'name' => 'Name',
            'last_name' => 'Last Name',
            'email' => 'Email',
            'description' => 'Description',
            'url' => 'Url',
            'university_id' => 'University ID',
            'department_id' => 'Department ID',
        ];
    }

    /**
     * Gets query for [[University]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUniversity()
    {
        return $this->hasOne(University::className(), ['id' => 'university_id']);
    }

    /**
     * Gets query for [[Department]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDepartment()
    {
        return $this->hasOne(Department::className(), ['id' => 'department_id']);
    }
}
